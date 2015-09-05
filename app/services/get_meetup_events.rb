require 'net/http'

class GetMeetupEvents
  def call
    events = get_events_from_meetup
    binding.pry
  end

  private

  def get_events_from_meetup
    Net::HTTP.get(meetup_api_call)
  end

  def meetup_api_call
    URI("https://api.meetup.com/2/events?&sign=true&photo-host=public&group_urlname=WellingtonRailsn00bs&page=20&key=#{api_key}")
  end

  def api_key
    ENV.fetch('MEETUP_API_KEY')
  end
end

