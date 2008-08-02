class RestaurantsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  
  def index
    @restaurants = Restaurant.find :all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find params[:id]
  end

  def create
    @restaurant = Restaurant.new params[:restaurant]
    if @restaurant.save
      redirect_to @restaurant
    else
      render :action => "new"
    end
  end

  private
  def authorized?
    current_user.can_create_restaurants?
  end
end
