class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item
  
  validates_presence_of :user, :menu_item
  validates_numericality_of :rating, :greater_than_or_equal_to => -1,
                            :less_than_or_equal_to => 1
  validates_uniqueness_of :user_id, :scope => :menu_item_id
end
