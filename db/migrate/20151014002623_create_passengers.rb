class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :user_id
      t.integer :booking_id

      t.timestamps null: false
    end
  end
end
