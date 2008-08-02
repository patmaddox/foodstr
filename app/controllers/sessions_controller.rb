class SessionsController < ApplicationController
  def create
    self.current_user = User.authenticate(params[:username], params[:password])
    if logged_in?
      redirect_to dashboard_url
    else
      flash[:error] = "Couldn't find that username/password combo"
      render :action => "new"
    end
  end

  def destroy
    self.current_user = nil
    flash[:success] = "You have been logged out"
    redirect_to login_url
  end
end
