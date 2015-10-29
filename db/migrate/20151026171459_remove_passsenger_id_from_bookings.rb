class RemovePasssengerIdFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :passenger_id, :integer
    remove_column :bookings, :adult, :integer
    remove_column :bookings, :children, :integer
    remove_column :users, :string, :string
    add_column :bookings, :passengers, :integer
    add_column :passengers, :booking_id, :integer
  end
end
