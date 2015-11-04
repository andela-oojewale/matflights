class RenameNoOfPassToNoOfPassengersOnBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :no_of_pass, :no_of_passengers
  end
end
