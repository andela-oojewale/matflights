class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :dept_time
      t.string :airline
      t.integer :cost
      t.string :from_id
      t.string :to_id

      t.timestamps null: false
    end
  end
end
