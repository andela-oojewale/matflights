class Booking < ActiveRecord::Base
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes| attributes["name"].blank? || attributes["email"].blank? }
  belongs_to :flight

  validates :confirmation_code, presence: true, uniqueness: true
  validates :flight_id, presence: true
  validates :no_of_passengers, presence: true

  def get_all_bookings(customer_id)
    Booking.connection.execute("SELECT b.id, b.no_of_passengers, b.flight_id, f.dept_date, f.airline, f.cost, f.from_id, f.to_id, a.name as departure, c.name as destination FROM bookings AS b INNER JOIN flights AS f ON b.flight_id = f.id INNER JOIN airports AS a ON f.from_id = a.id INNER JOIN airports AS c ON f.to_id = c.id  WHERE (customer_id = customer_id) ")
  end

  def delete_record(booking_id)
    Booking.delete(booking_id)
  end

end