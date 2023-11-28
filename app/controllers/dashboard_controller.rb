class DashboardController < ApplicationController
  def profile
    @user = current_user
    @recipes = @user.recipes
  end
end
