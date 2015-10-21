class AddIndexToFlightsFromId < ActiveRecord::Migration
  def change
    add_index :flights, :from_id
  end
end
