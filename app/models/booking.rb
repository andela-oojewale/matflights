class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
  belongs_to :flight

  validates :confirmation_code, presence: true, uniqueness: true
  validates :flight_id, presence: true
  validates :no_of_passengers, presence: true

  def get_all_bookings(column, id)
    Booking.connection.execute("SELECT b.id, b.no_of_passengers, b.flight_id, f.dept_date, f.airline, f.cost, f.from_id, f.to_id, f.flight_code, a.name as departure, c.name as destination FROM bookings AS b INNER JOIN flights AS f ON b.flight_id = f.id INNER JOIN airports AS a ON f.from_id = a.id INNER JOIN airports AS c ON f.to_id = c.id  WHERE (#{column} = #{id})")
  end

  def delete_record(booking_id)
    Booking.delete(booking_id)
  end

  def get_confirmation(code)
    Booking.find_by confirmation_code: code
  end

  def reset_passengers(num, id)
    booking = Booking.find_by id: id
    booking.update(no_of_passengers: num)
  end

  # def update_records(booking)
  #   update_pass = Passenger.where(booking_id: booking[:booking_id]).
  #     update( no_of_passengers: booking[:booking_id]

  #     )
  # end

end