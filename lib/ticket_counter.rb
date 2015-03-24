class TicketCounter < Model
  attribute :stations, Array[Station]
  include StationDataReader
  attr_accessor :stations

  def initialize
    stations = []
    read_stations.keys.each do |station_num|
      stations << Station.new(number: station_num, name: read_stations[station_num][:name])
    end
    puts formatted_stations
    puts "Please enter From station number"
    from_station_num = gets
    puts "Please enter To station number"
    to_station_num = gets
    print_ticket_for from_station_num.strip, to_station_num.strip
  end

  def print_ticket_for from_station_num, to_station_num
    ticket = Ticket.new(from_station_num: from_station_num, to_station_num: to_station_num)
    ticket.display
  end
end
