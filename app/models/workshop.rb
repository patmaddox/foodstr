class Workshop < ActiveRecord::Base
  validates_presence_of :name, :scheduled_date, :address
  has_many :registrations
  has_many :attendees, :through => :registrations, :source => :user

  def register(user)
    raise "The user is already registered" if attendees.include?(user)
    attendees << user
    true
  end
end
