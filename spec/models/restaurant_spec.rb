require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Restaurant do
  before(:each) do
    @valid_attributes = {
      :name => "Lil Frankie's'",
      :address_street => "11 1st Ave",
      :address_city => "New York",
      :address_state => "NY",
      :address_zip => "10003"
    }
  end

  it "should create a new instance given valid attributes" do
    Restaurant.create!(@valid_attributes)
  end

  [:name, :address_street, :address_city, :address_state, :address_zip].each do |required_attribute|
    it "should require #{required_attribute}" do
      Restaurant.new(@valid_attributes.except(required_attribute)).should_not be_valid
    end
  end
end
