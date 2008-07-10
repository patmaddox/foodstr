class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :login, :email, :password

  def self.authenticate(login, password)
    find_by_login_and_password login, password
  end
end
