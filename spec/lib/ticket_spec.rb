require 'spec_helper'
RSpec.describe Ticket, type: :model do

  context "prints ticket as expected" do
    let(:ticket) { Ticket.new(from_station_num: 1, to_station_num: 2) }

    it "expects a certain format of ticket" do
      expect(ticket.to_s).to match(/Purchase Date & Time/)
    end
  end

  describe "#fare" do
    let(:super_ticket) { Ticket.new(from_station_num: 1, to_station_num: 18) }
    let(:mini_ticket) { Ticket.new(from_station_num: 5, to_station_num: 6) }
    let(:medium_ticket) { Ticket.new(from_station_num: 2, to_station_num: 10) }

    it "charges 10 rs for travel upto 5 statons" do
      expect(mini_ticket.fare).to eq(10)
    end

    it "charges 5 rs for every 5 stations after base fare" do
      expect(medium_ticket.fare).to eq(15)
    end

    it "charges flat price of 20 rs for whole stretch travel" do
      expect(super_ticket.fare).to eq(20)
    end
  end

  describe "#is_ticket_for_whole_stretch?" do
    let(:super_ticket) { Ticket.new(from_station_num: 1, to_station_num: 18) }
    let(:mini_ticket) { Ticket.new(from_station_num: 5, to_station_num: 6) }

    it "checks if the ticket is for whole stretch" do
      expect(mini_ticket.is_ticket_for_whole_stretch?).to eq(false)
      expect(super_ticket.is_ticket_for_whole_stretch?).to eq(true)
    end
  end
end
