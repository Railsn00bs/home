class Event < ActiveRecord::Base
  def effective_end_at
    if end_at.present?
      end_at
    else
      start_at + 3.hours
    end
  end
end
