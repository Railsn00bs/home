class HomeController < ApplicationController
  def index
    @classifier = AppropriateEventEmoji.new
    @events = Event.where('start_at > ?', Time.now - 1.week)
  end
end
