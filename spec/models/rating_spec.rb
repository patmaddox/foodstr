require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Rating do
  before(:each) do
    @valid_attributes = {
      :user => User.new,
      :menu_item => MenuItem.new,
      :rating => 1
    }
  end

  it "should be valid given valid attributes" do
    Rating.new(@valid_attributes).should be_valid
  end

  it "should require a user" do
    Rating.new(@valid_attributes.except(:user)).should_not be_valid
  end

  it "should require a menu_item" do
    Rating.new(@valid_attributes.except(:menu_item)).should_not be_valid
  end

  it "should allow the rating to be 1, -1, or 0" do
    Rating.new(@valid_attributes.merge(:rating => 1)).should be_valid
    Rating.new(@valid_attributes.merge(:rating => 0)).should be_valid
    Rating.new(@valid_attributes.merge(:rating => -1)).should be_valid
    
    Rating.new(@valid_attributes.merge(:rating => 2)).should_not be_valid
    Rating.new(@valid_attributes.merge(:rating => -2)).should_not be_valid
    Rating.new(@valid_attributes.merge(:rating => nil)).should_not be_valid
  end
end
