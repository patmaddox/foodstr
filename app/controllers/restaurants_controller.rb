class RestaurantsController < ApplicationController
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
end
