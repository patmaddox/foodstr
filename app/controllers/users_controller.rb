class UsersController < ApplicationController
  before_filter :login_required, :only => [:dashboard]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      self.current_user = @user
      redirect_to dashboard_url
    else
      render :action => "new"
    end
  end

  def dashboard
  end
end
