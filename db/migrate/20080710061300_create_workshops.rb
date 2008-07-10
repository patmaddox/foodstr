class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.string :name
      t.date :scheduled_date
      t.string :address
      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
