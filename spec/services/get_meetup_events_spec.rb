require 'rails_helper'

describe GetMeetupEvents do
  it 'can be called' do
    expect { result = GetMeetupEvents.new.call }
      .not_to raise_error

    expect(result).to be
  end
end

