require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :first_name => "Pat",
      :last_name => "Maddox",
      :login => "pat_maddox",
      :email => "pat@patmaddox.com",
      :password => "password"
    }
  end

  it "should be valid given valid attributes" do
    User.new(@valid_attributes).should be_valid
  end

  [:first_name, :last_name, :login, :email, :password].each do |field|
    it "should require #{field} " do
      u = User.new(@valid_attributes.except(field))
      u.should_not be_valid
      u.should have_at_least(1).error_on(field)
    end
  end
end
