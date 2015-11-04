class RemoveReturnTimeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :return_time, :string
  end
end
