require File.expand_path(File.join(File.dirname(__FILE__), "..", "spec_helper"))

describe NilUser do
  it "should respond to nil with true" do
    NilUser.instance.should be_nil
  end

  it "should not be able to create restaurants" do
    NilUser.instance.can_create_restaurants?.should be_false
  end

  it "should not be able to create menu items" do
    NilUser.instance.can_create_menu_items?.should be_false
  end
end
