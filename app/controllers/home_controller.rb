class HomeController < ApplicationController
  def index
    @classifier = AppropriateEventEmoji.new
    @events = Event.where('start_at > ?', Time.now.midnight)
    if @events.none?
      @events = [
        OpenStruct.new(:name => 'None 😿')
      ]
    end
  end
end
