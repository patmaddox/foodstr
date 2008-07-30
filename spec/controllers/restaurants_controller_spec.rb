require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RestaurantsController do
  describe "GET /restaurants" do
    it "should be ok" do
      get :index
      response.should be_success
    end

    it "should render new.html" do
      get :index
      response.should render_template("index")
    end

    it "should assign restaurants to the view" do
      get :index
      assigns[:restaurants].should_not be_nil
    end
  end

  describe "GET /restaurants/new" do
    it "should be ok" do
      get :new
      response.should be_success
    end

    it "should render new.html" do
      get :new
      response.should render_template("new")
    end

    it "should assign a restaurant object to the view" do
      get :new
      assigns[:restaurant].should_not be_nil
    end
  end

  describe "GET /restaurants/1" do
    before(:each) do
      @restaurant = stub_model(Restaurant)
      Restaurant.stub!(:find).and_return @restaurant
    end
    
    def do_get
      get :show, :id => "1"
    end
    
    it "should be ok" do
      do_get
      response.should be_success
    end

    it "should render show" do
      do_get
      response.should render_template("show")
    end

    it "should find the restaurant and assign it to the view" do
      Restaurant.should_receive(:find).with("1").and_return @restaurant
      do_get
      assigns[:restaurant].should == @restaurant
    end
  end

  describe "POST /restaurants" do
    def do_post(attributes=valid_restaurant_attributes)
      post :create, :restaurant => attributes
    end

    it "should create a new restaurant" do
      lambda {
        do_post
      }.should change(Restaurant, :count).by(1)
    end

    it "should redirect to the restaurant page" do
      do_post
      r = Restaurant.find :first, :order => "created_at DESC"
      response.should redirect_to(restaurant_url(r))
    end

    it "should render the form if it doesn't save" do
      do_post valid_restaurant_attributes.except(:name)
      response.should render_template("new")
      assigns[:restaurant].should_not be_nil
    end
  end
end
