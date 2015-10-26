class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.timestamp :booking_time
      t.integer :no_of_pass
      t.date :return_time
      t.integer  :adult
      t.integer  :children
      t.integer :flight_id
      t.integer :passenger_id

      t.timestamps null: false
    end
  end
end
