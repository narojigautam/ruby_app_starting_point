require 'spec_helper'
RSpec.describe StationDataReader, type: :module do
  let(:data_reader_class) { class DataReader; include StationDataReader; end }
  let(:data_reader) { data_reader_class.new }

  describe "#read_stations" do
    it "reads data of stations" do
      expect(data_reader.read_stations).to include({"1" => {name: 'Chennai Beach'}})
    end
  end

  describe "#formatted_stations" do
    it "formats the stations well" do
      expect(data_reader.formatted_stations).to match('1: Chennai Beach')
    end
  end

  describe "#max_number_of_stations" do
    it "gives the maximum number of stations" do
      expect(data_reader.max_number_of_stations).to eq(18)
    end
  end

  describe "#lowest_ranked_station" do
    it "gives the lowest ranked stations" do
      expect(data_reader.lowest_ranked_station).to eq(1)
    end
  end
end
