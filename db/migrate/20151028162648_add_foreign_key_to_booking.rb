class AddForeignKeyToBooking < ActiveRecord::Migration
  def change
    add_foreign_key :bookings, :flights
  end
end
