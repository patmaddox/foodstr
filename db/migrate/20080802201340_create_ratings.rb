class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :menu_item_id
      t.integer :user_id
      t.text :comment
      t.integer :rating, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
