class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  validates_presence_of :name, :restaurant
  has_many :ratings do
    def from_user(user)
      find_by_user_id user.id
    end
  end

  def points
    ratings.sum(:rating) || 0
  end
end
