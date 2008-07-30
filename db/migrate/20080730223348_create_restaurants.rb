class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.string :address_street
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :website

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
