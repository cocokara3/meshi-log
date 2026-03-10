class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_non_guest

  def index
    @favorites = current_user.favorite_restaurants
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.favorites.create(user: current_user)
    redirect_to @restaurant, notice: 'お気に入りに追加しました'
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    favorite = @restaurant.favorites.find_by(user: current_user)
    favorite.destroy
    redirect_to @restaurant, notice: 'お気に入りを解除しました'
  end
end