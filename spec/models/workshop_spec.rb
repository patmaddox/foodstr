require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Workshop do
  before(:each) do
    @valid_attributes = {
      :name => "My Awesome Workshop",
      :scheduled_date => Date.parse("7/24/2008"),
      :address => "730 Market St San Francisco CA"
    }
  end

  it "should be valid given valid attributes" do
    Workshop.new(@valid_attributes).should be_valid
  end

  it "should require name" do
    w = Workshop.new(@valid_attributes.except(:name))
    w.should_not be_valid
    w.should have_at_least(1).error_on(:name)
  end

  it "should require scheduled_date" do
    w = Workshop.new(@valid_attributes.except(:scheduled_date))
    w.should_not be_valid
    w.should have_at_least(1).error_on(:scheduled_date)
  end

  it "should require address" do
    w = Workshop.new(@valid_attributes.except(:address))
    w.should_not be_valid
    w.should have_at_least(1).error_on(:address)
  end

  describe "#register" do
    before(:each) do
      @user = create_user
      @w = Workshop.create! @valid_attributes      
    end
    
    it "should add the user to the list of attendees" do
      @w.attendees.should_not include(@user)
      @w.register @user
      @w.attendees.should include(@user)
    end

    it "should not add the user if he is already registered" do
      @w.register @user
      lambda {
        @w.register @user
      }.should raise_error(/already registered/)
    end
  end
end
