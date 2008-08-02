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
      controller.should be_logged_in
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

  describe "DELETE /sessions" do
    before(:each) do
      log_in admin_user
    end
    
    it "should log the current user out" do
      delete :destroy
      controller.should_not be_logged_in
    end

    it "should redirect to the login page" do
      delete :destroy
      response.should redirect_to(login_path)
    end

    it "should flash a success message" do
      delete :destroy
      flash[:success].should_not be_blank
    end
  end
end
