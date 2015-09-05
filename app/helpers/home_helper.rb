module HomeHelper
  def event_display_name(event)
    display_name = event.name

    if event.start_at.present?
      time_in_words = distance_of_time_in_words(Time.now, event.start_at)
      display_name += " - #{time_in_words} away"
    end

    display_name
  end
end
