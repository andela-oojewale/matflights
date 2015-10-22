class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :dept_date
      t.string :dept_time
      t.string :airline
      t.string :flight_code
      t.integer :cost
      t.integer :from_id
      t.integer :to_id

      t.timestamps null: false
    end
  end
end
