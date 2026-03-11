class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @restaurants_count = current_user.restaurants.count
    @favorites_count = current_user.favorites.count
  end
end