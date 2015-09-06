class Event < ActiveRecord::Base
  DURATION = 3.hours

  def end_at
    start_at + DURATION
  end
end
