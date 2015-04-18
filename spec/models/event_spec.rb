require 'rails_helper'
require 'date'
RSpec.describe Event, type: :model do
    it "getStart should return the date in miliseconds" do
        start = DateTime.new(2001, 1, 2, 3, 4, 5)
        event = Event.new
        event.start_date = start
        expect(event.getStart).to eq(978404645000.0)
    end

    it "getEnd should return the date in miliseconds" do
        endD = DateTime.new(2001, 1, 2, 3, 4, 5)
        event = Event.new
        event.end_date = endD
        expect(event.getEnd).to eq(978404645000.0)
    end
end
