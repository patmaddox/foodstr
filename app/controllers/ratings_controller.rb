class RatingsController < ApplicationController
  before_filter :login_required
  before_filter :load_menu_item

  def create
    @rating = @menu_item.ratings.find_by_user_id(current_user.id) ||
      @menu_item.ratings.build(:user => current_user)
    @rating.update_attributes! params[:rating]
    head :ok
  end

  private
  def load_menu_item
    @restaurant = Restaurant.find params[:restaurant_id]
    @menu_item = @restaurant.menu_items.find params[:menu_item_id]
  end
end
