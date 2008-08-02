class AddPointsFieldToMenuItems < ActiveRecord::Migration
  def self.up
    add_column :menu_items, :points, :integer, :default => 0
  end

  def self.down
    remove_column :menu_items, :points
  end
end
