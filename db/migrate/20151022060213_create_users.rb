class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :string
      t.string :email
      t.string :provider
      t.string :user_code

      t.timestamps null: false
    end
  end
end
