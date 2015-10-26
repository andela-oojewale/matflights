class RemoveBookingTimeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :booking_time, :datetime
  end
end
