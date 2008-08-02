require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MenuItemsController do
  before(:each) do
    @restaurant = Restaurant.create! valid_restaurant_attributes
  end

  describe "GET /restaurants/1/menu_items/new" do
    def do_get
      get :new, :restaurant_id => @restaurant.to_param
    end

    it "should be ok" do
      do_get
      response.should be_success
    end

    it "should render new.html" do
      do_get
      response.should render_template("new")
    end

    it "should assign a menu item to the view" do
      do_get
      assigns[:menu_item].should_not be_nil
    end
  end

  describe "POST /restaurants/1/menu_items" do
    def do_post(options = {})
      post :create, :restaurant_id => @restaurant.to_param,
           :menu_item => {:name => "Super pasta"}.merge(options)
    end

    it "should redirect to the restaurant's page" do
      do_post
      response.should redirect_to(restaurant_url(@restaurant))
    end

    it "should create a new menu item for the restaurant" do
      lambda {
        do_post
      }.should change(@restaurant.menu_items, :count).by(1)
    end

    it "should flash a success message" do
      do_post
      flash[:success].should_not be_blank
    end

    it "should render the form on failure" do
      do_post :name => ""
      response.should render_template("new")
    end
  end
end
