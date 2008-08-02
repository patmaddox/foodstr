require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MenuItem do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :restaurant => Restaurant.new(valid_restaurant_attributes)
    }
  end

  it "should create a new instance given valid attributes" do
    MenuItem.create!(@valid_attributes)
  end

  it "should require a name" do
    MenuItem.new(@valid_attributes.except(:name)).should_not be_valid
  end

  it "should require a restaurant" do
    MenuItem.new(@valid_attributes.except(:restaurant)).should_not be_valid
  end
end
