class RenamePasssengersToPassengersCountOnBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :passengers, :passengers_count
  end
end
