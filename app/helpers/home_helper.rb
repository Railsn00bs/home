module HomeHelper
  def event_line(event, classifier)
    event_line = event.name

    if event.start_at.present?
      time_in_words = time_ago_in_words(event.start_at)
      time_tail = event.start_at > Time.now ? "away" : "ago"
      event_line += " - #{time_in_words} #{time_tail} " + classifier.call(event)
    end

    event_line
  end
end
