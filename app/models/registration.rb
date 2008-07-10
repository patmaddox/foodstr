class Registration < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :user
end
