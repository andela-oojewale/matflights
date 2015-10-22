class AddIndexToFlightsToId < ActiveRecord::Migration
  def change
    add_index :flights, :to_id
  end
end
