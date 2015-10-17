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

airlines = ["Qatar Airways", "Singapore Airlines", "Cathay Pacific Airways", "Turkish Airlines", "Emirates", "Etihad Airways", "Lufthansa", "Air France", "British Airways", "KLM"]

airports_list.each { | airport | Airport.create(airport) }


