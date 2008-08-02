class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  validates_presence_of :name, :restaurant
end
