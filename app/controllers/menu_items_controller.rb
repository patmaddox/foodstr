class MenuItemsController < ApplicationController
  before_filter :load_restaurant
  
  def new
    @menu_item = @restaurant.menu_items.build
  end

  def create
    @menu_item = @restaurant.menu_items.build params[:menu_item]
    if @menu_item.save
      flash[:success] = "#{@menu_item.name} was created"
      redirect_to @restaurant
    else
      render :action => "new"
    end
  end

  private
  def load_restaurant
    @restaurant = Restaurant.find params[:restaurant_id]
  end
end
