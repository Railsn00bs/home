require 'net/http'

class GetMeetupEvents
  def call
    events = get_events_from_meetup

    events.each do |event|
      add_or_update_event_in_database(event)
    end

    Event.all
  end

  private

  def add_or_update_event_in_database(event_json)
    # TODO - less bad, and store duration instead of end_at

    event = Event.find_by(:meetup_event_id => event_json['id'])
    event ||= Event.new

    event.update!(
      :meetup_event_id => event_json['id'],
      :name => event_json["name"],
      :description => event_json["description"],
      :start_at => Time.at(event_json["time"].to_i / 1000).to_datetime,
      :venue_name => event_json["group"]["name"],
      :status => event_json["status"],
      :url => event_json["event_url"]
    )
  end

  def get_events_from_meetup
    JSON.parse(Net::HTTP.get(meetup_api_call))['results']
  end

  def meetup_api_call
    URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&group_urlname=WellingtonRailsn00bs&page=20&key=#{api_key}")
  end

  def api_key
    ENV.fetch('MEETUP_API_KEY')
  end
end
