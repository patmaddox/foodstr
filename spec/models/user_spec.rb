require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  it "should be valid given valid attributes" do
    new_user.should be_valid
  end

  [:first_name, :last_name, :login, :email, :password].each do |field|
    it "should require #{field} " do
      u = new_user field => nil
      u.should_not be_valid
      u.should have_at_least(1).error_on(field)
    end
  end

  it "should not allow duplicate login names" do
    create_user :login => "pat", :email => "pat@pat.com"
    new_user(:login => "pat", :email => "bob@bob.com").should_not be_valid
  end
  
  it "should not allow duplicate emails" do
    create_user :email => "pat@pat.com", :login => "pat"
    new_user(:email => "pat@pat.com", :login => "bob").should_not be_valid
  end

  describe "User.authenticate" do
    before(:each) do
      @user = create_user
    end

    it "should find the user when given matching credentials" do
      User.authenticate(@user.login, @user.password).should == @user
    end

    it "should return nil when the credentials don't match a user" do
      User.authenticate(@user.login, "nope, not my password").should be_nil
    end
  end
end
