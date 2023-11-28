class DashboardController < ApplicationController
  def profile
    @user = current_user
    @favorite_recipes = @user.favorite
  end
end
