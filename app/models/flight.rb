class Flight < ActiveRecord::Base
  has_many :bookings
  has_many :passengers, through: :bookings
  belongs_to :from, class_name: "Airport"
  belongs_to :to, class_name: "Airport"

  validates :to_id, presence: true
  validates :from_id, presence: true

  def get_flight(to, from , dept_time = nil)
    if dept_time.nil? || dept_time == ""
      Flight.includes(:from, :to).where( to_id: to, from_id: from)
    else
      Flight.includes(:from, :to).where( to_id: to, from_id: from, dept_time: dept_time )
    end
  end

  def get_all_flights
    Flight.includes(:from, :to).order(cost: :asc)
  end

end
