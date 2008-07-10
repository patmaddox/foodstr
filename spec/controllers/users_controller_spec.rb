require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  describe "GET /users/new" do
    def do_get
      get :new
    end
    
    it "should be ok" do
      do_get
      response.should be_success
    end

    it "should render the new template" do
      do_get
      response.should render_widget(Views::Users::New)
    end
  end

  describe "POST /users" do
    def do_post(user_options = {})
      post :create, :user => user_options.reverse_merge({
          :first_name => "Pat", :last_name => "Maddox",
          :login => "pat", :email => "pat@patmaddox.com",
          :password => "password"})
    end

    describe "success" do
      it "should be ok" do
        do_post
        response.should be_success
      end

      it "should create a user" do
        lambda { do_post }.should change(User, :count).by(1)
      end
    end

    describe "failure" do
      it "should render the form again" do
        do_post :login => ""
        response.should render_widget(Views::Users::New)
      end

      it "should not create a user" do
        lambda { do_post :login => "" }.should_not change(User, :count)
      end
    end
  end
end
