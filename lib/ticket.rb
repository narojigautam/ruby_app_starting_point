class Ticket < Model
  attribute :from_station_num, String
  attribute :to_station_num, String

  include StationDataReader

  def display
    puts to_s
  end

  def to_s
    "Purchase Date & Time \n #{from_station_name} \n #{to_station_name} \n #{number_of_stops} Stops \n Rs. #{fare}"
  end

  def from_station_name
    read_stations[from_station_num][:name]
  end

  def to_station_name
    read_stations[to_station_num][:name]
  end

  def number_of_stops
    (from_station_num.to_i - to_station_num.to_i).abs
  end

  def fare
    if is_ticket_for_whole_stretch?
      20
    elsif number_of_stops > 5
      extra_fare = 0
      (number_of_stops / 5 - 1).times { extra_fare += 5 }
      extra_fare += 5 if number_of_stops % 5 > 0
      10 + extra_fare
    else
      10
    end
  end

  def is_ticket_for_whole_stretch?
    return true if max_number_of_stations == to_station_num.to_i and lowest_ranked_station == from_station_num.to_i
    lowest_ranked_station == to_station_num.to_i and max_number_of_stations == from_station_num.to_i
  end
end
