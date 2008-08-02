class SetRestaurantDefaultAddressFields < ActiveRecord::Migration
  def self.up
    change_column_default :restaurants, :address_city, "New York"
    change_column_default :restaurants, :address_state, "NY"
  end

  def self.down
    change_column_default :restaurants, :address_city, nil
    change_column_default :restaurants, :address_state, nil
  end
end
