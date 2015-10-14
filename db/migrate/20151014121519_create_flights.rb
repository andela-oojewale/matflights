class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :dept_time
      t.string :airline
      t.integer :cost
      t.string :from
      t.string :to
      t.integer :passenger_id
      t.integer :airport_id

      t.timestamps null: false
    end
  end
end
