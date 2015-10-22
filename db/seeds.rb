# Data seeded into db
Airport.destroy_all
Flight.destroy_all

airports_list = [
  { name: "Murtala Muhammed International Airport", country: "Nigeria", city: "Lagos", code: "MF1" },
  { name: "Nnamdi Azikwe International Airport", country: "Nigeria", city: "Lagos", code: "MF2" },
  { name: "John Lennon Airport", country: "England", city: "Liverpool", code: "MF3" },
  { name: "Manchester Airport", country: "England", city: "Manchester", code: "MF4" },
  { name: "Gatwick Airport", country: "England", city: "West Sussex", code: "MF5" },
  { name: "Heathrow Airport", country: "England", city: "London", code: "MF6" },
  { name: "Los Angeles International Airport", country: "US", city: "Los Angeles", code: "MF7" },
  { name: "San Francisco International Airport", country: "US", city: "San Francisco", code: "MF8" },
  { name: "Indira Gandhi International Airport", country: "India", city: "Delhi", code: "MF9" },
  { name: "Dubai International Airport", country: "Dubai", city: "Garhoud", code: "MF10" },
  { name: "Beijing Capital International Airport", country: "China", city: "Beijing", code: "MF11" },
  { name: "Singapore Changi Airport", country: "Singapore", city: "Changi", code: "MF13" },
  { name: "Istanbul Atatürk Airport", country: "Turkey", city: "Istanbul", code: "MF14" },
  { name: "Frankfurt Airport", country: "Germany", city: "Frankfurt", code: "MF15" },
  { name: "Amsterdam Airport Schiphol", country: "Holland", city: "Haarlemmermeer", code: "MF16" }

]

airports_id = []

airports_list.each { | airport | airports_id << Airport.create(airport).id }

airlines = [ { "Qatar Airways" => 100 }, { "Singapore Airlines" => 90 }, { "Cathay Pacific Airways" => 80 }, { "Turkish Airlines" => 70 }, { "Emirates" => 60 }, { "Etihad Airways" => 50 }, { "Lufthansa" => 40 }, { "Air France" => 30 }, { "British Airways" => 20 }, { "KLM" => 10 } ]

def set_flight_time
  dept_time = Time.at(Time.now.to_i + (24 * 60 * 60 * generate_rand(1,21)))
  time_of_flight = [ "6.00am", "11:00am", "1:00pm", "2:30pm", "5:00pm", "11:00pm"]
  flight_time = time_of_flight.sample
  [dept_time, flight_time]
end

def set_airports(airports_id)
  from_id =  airports_id.sample
  to_id = airports_id.sample
  if from_id == to_id
    to_id = airports_id.sample
  end
  [ from_id, to_id ]
end

def set_flights_info(dist_in_hours, airports_id, airlines)
  rand_airline = airlines.sample
  airline = rand_airline.keys[0]
  cost = dist_in_hours * rand_airline[airline] * 755
  flight_code = "MF#{generate_rand(1,400)}"
  locations = set_airports(airports_id)
  flight_datetime = set_flight_time
  { dept_date: flight_datetime[0], dept_time: flight_datetime[1],  airline: airline, cost: cost, from_id: locations[0], to_id: locations[1], flight_code: flight_code }
end

200.times do
  Flight.create(set_flights_info((generate_rand(4,12)), airports_id, airlines))
end
