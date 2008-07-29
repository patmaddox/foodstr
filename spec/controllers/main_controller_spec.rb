require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MainController do
  describe "home page" do
    it "should be ok" do
      get :homepage
      response.should be_success
      response.should render_template("homepage")
    end
  end
end
