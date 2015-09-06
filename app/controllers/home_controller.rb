class HomeController < ApplicationController
  def index
    @classifier = AppropriateEventEmoji.new
    @events = Event.where('start_at > ?', Time.now - 1.week)
    if @events.none?
      @events = [
        OpenStruct.new(:name => 'None 😿')
      ]
    end
  end
end
