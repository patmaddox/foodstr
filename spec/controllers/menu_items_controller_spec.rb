require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MenuItemsController do
  before(:each) do
    @restaurant = Restaurant.create! valid_restaurant_attributes
  end

  describe "GET /restaurants/1/menu_items" do
    before(:each) do
      @restaurant.menu_items.create! :name => "Pasta carbonara"
      @restaurant.menu_items.create! :name => "Tiramisu"
    end

    def do_get
      get :index, :restaurant_id => @restaurant.to_param
    end

    it "should be ok" do
      do_get
      response.should be_success
    end

    it "should render index.html" do
      do_get
      response.should render_template("index")
    end

    it "should show the names of the items on the page" do
      do_get
      response.body.should include("Pasta carbonara")
      response.body.should include("Tiramisu")
    end
  end
end
