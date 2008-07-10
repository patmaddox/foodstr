class UsersController < ApplicationController
  def new
    @user = User.new
    render :widget => Views::Users::New
  end

  def create
    @user = User.new params[:user]
    if @user.save
      head :ok
    else
      render :widget => Views::Users::New
    end
  end
end
