class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :dept_time
      t.string :airline
      t.string :flight_id
      t.integer :cost
      t.integer :from_id
      t.integer :to_id

      t.timestamps null: false
    end
  end
end
