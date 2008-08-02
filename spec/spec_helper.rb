# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
end

require File.expand_path(File.join(File.dirname(__FILE__), 'matchers', 'render_widget'))

Spec::Rails::Example::RailsExampleGroup.class_eval do
  def create_user
    User.create!(:first_name => "Pat", :last_name => "Maddox", :login => "pat",
                 :email => "pat@patmaddox.com", :password => "password")
  end

  def valid_restaurant_attributes
    {
      :name => "Lil Frankie's'",
      :address_street => "11 1st Ave",
      :address_city => "New York",
      :address_state => "NY",
      :address_zip => "10003"
    }    
  end

  def admin_user
    @_admin_user ||= create_user
  end
end

Spec::Rails::Example::ControllerExampleGroup.class_eval do
  integrate_views

  def log_in(user)
    controller.send :current_user=, user
  end
end
