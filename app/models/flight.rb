class Flight < ActiveRecord::Base
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"

  def get_flight(to, from , dept_time)
    Flight.select(:airline).where( to_id: to, from_id: from, dept_time: dept_time )
  end

  def get_all_flights
    Flight.all.order(cost: :asc)
  end

end
