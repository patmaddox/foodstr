require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RatingsController do
  before(:each) do
    @restaurant = create_restaurant
    @menu_item = @restaurant.menu_items.create! :name => "pasta carbonara"
    log_in admin_user
  end
  
  describe "POST /restaurants/1/menu_items/2/ratings" do
    def do_post
      post :create, :restaurant_id => @restaurant.to_param,
                    :menu_item_id => @menu_item.to_param,
                    :rating => {:rating => 1, :comment => "Love it!"}
    end

    it "should be successful" do
      do_post
      response.should be_success
    end

    it "should create a new rating" do
      lambda {
        do_post
      }.should change(@menu_item.ratings, :count).by(1)
    end

    it "should set the rating's creator to the current user" do
      do_post
      Rating.find(:first, :order => "created_at DESC").user.should == admin_user
    end

    it "should update a rating if the user already has made one" do
      Rating.create! :user => admin_user, :menu_item => @menu_item, :rating => -1
      lambda {
        do_post
      }.should_not change(@menu_item.ratings, :count)
      Rating.find(:first, :order => "created_at DESC").rating.should == 1
    end

    it "should require a logged in user" do
      log_in nil
      do_post
      response.should redirect_to(login_url)
    end
  end
end
