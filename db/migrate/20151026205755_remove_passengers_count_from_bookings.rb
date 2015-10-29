class RemovePassengersCountFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :passengers_count, :integer
  end
end
