require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Restaurant do
  it "should create a new instance given valid attributes" do
    Restaurant.create!(valid_restaurant_attributes)
  end

  [:name, :address_street, :address_city, :address_state, :address_zip].each do |required_attribute|
    it "should require #{required_attribute}" do
      Restaurant.new(valid_restaurant_attributes.except(required_attribute)).should_not be_valid
    end
  end
end
