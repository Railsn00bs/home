class AppropriateEventEmoji
  def initialize
  end

  def call(event)
    classifier.classify(event, Time.now)
  end

  private

  def classifier
    return @range_classifier if @range_classifier

    projection = -> (e, base_time) { [base_time - e.start_at, base_time - e.end_at ] }
    upcoming = [
      [-10.days, '😞'],
      [-4.days, '😐'],
      [-3.days, '😯'],
      [-2.days, '😃'],
      [-1.days, '😄'],
      [0, '🎁']
    ]

    aftermath = [
      {
        lower: [0, nil],
        upper: [nil, 0],
        result: '🎉',
      },
      {
        lower: [0, nil],
        upper: [0, Event::DURATION],
        result: '😪',
      },
      {
        lower: [0, nil],
        upper: [Event::DURATION, nil],
        result: '😴'
      }
    ]

    @range_classifier = RangeClassifier.new(projection).append_lower_stream(upcoming).append_ranges(aftermath)
  end
end
