class Flight < ActiveRecord::Base

  has_many :bookings
  has_many :passengers, through: :bookings

  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"

  validates :to_id, presence: true
  validates :from_id, presence: true

  def get_flight(to, from , dept_time = nil)
    if dept_time.nil? || dept_time == ""
      Flight.includes(:from, :to).where( to_id: to, from_id: from).order(cost: :asc)
    else
      Flight.includes(:from, :to).where( to_id: to, from_id: from, dept_date: dept_time ).order(dept_date: :asc)
    end
  end

  def get_all_flights
    Flight.includes(:from, :to).order(cost: :asc)
  end

  def  valid_airports(from, to)
    if to.empty? || from.empty?
      message = "Select your departure and destination airports."
    elsif to == from
      message = "Departure and Destination airports can not be the same."
    end
  end

  def search_flight(to, from , dept_time)
    @flights_list = get_flight(to, from , dept_time)
    if @flights_list.empty?
      message = "No flights found. Please make another search."
    else
      message = @flights_list
    end
  end

end