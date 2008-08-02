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
end
