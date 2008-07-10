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
end
