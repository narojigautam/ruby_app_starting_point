module StationDataReader
  def read_stations
      {
        "1" => { name: "Chennai Beach" },
        "2" => { name: "Chennai Fort" },
        "3" => { name: "Chennai Park" },
        "4" => { name: "Chennai Egmore" },
        "5" => { name: "Chetpet" },
        "6" => { name: "Nungambakkam" },
        "7" => { name: "Kodambakkam" },
        "8" => { name: "Mambalam" },
        "9" => { name: "Saidapet" },
        "10" => { name: "Guindy" },
        "11" => { name: "St. Thomas Mount" },
        "12" => { name: "Pazhavanthangal" },
        "13" => { name: "Meenambakkam" },
        "14" => { name: "Trisulam" },
        "15" => { name: "Pallavaram" },
        "16" => { name: "Chromepet" },
        "17" => { name: "Tambaram Sanatorium" },
        "18" => { name: "Tambaram" }
      }
  end

  def formatted_stations
    formatted_result = "List of Stations: "
    read_stations.keys.each do |station_num|
      formatted_result += "\n#{station_num}: #{read_stations[station_num][:name]}"
    end
    formatted_result
  end

  def max_number_of_stations
    read_stations.keys.map{|num| num.to_i }.max
  end

  def lowest_ranked_station
    read_stations.keys.map{|num| num.to_i }.min
  end
end
