# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '103d4b498d01d7310324aa47b7fada80'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def login_required
    redirect_to(login_url) unless logged_in? && authorized?
  end

  helper_method :logged_in?
  def logged_in?
    !current_user.nil?
  end

  def authorized?
    true
  end

  def current_user=(user)
    if user
      @_current_user = user
      session[:user_id] = user.id
    else
      @_current_user = NilUser.instance
      session[:user_id] = nil
    end
  end

  helper_method :current_user
  def current_user
    return NilUser.instance if session[:user_id].nil?
    @_current_user ||= User.find(session[:user_id])
  end
end
