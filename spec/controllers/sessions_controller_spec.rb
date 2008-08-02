require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SessionsController do
  describe "GET /sessions/new" do
    it "should be ok" do
      get :new
      response.should be_success
    end

    it "should render new.html" do
      get :new
      response.should render_template("new")
    end
  end

  describe "POST /sessions" do
    it "should redirect to the dashboard on success" do
      post :create, :username => admin_user.login, :password => admin_user.password
      response.should redirect_to(dashboard_url)
    end

    describe "on failure" do
      it "should render the form again" do
        post :create, :username => "bad", :password => "password"
        response.should render_template("new")
      end

      it "should flash an error message" do
        post :create, :username => "bad", :password => "password"
        flash[:error].should_not be_blank
      end
    end
  end
end
