class AddConfirmationCodeToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmation_code, :integer
  end
end
