class UsersController < ApplicationController
  def new
    @user = User.new
    render :widget => Views::Users::New
  end
end
