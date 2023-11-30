class RecipesController < ApplicationController

  def search
    if params[:query].present?
      @results = SpoonacularService.new.search_recipes(params[:query])
      @recipes = @results.parsed_response["results"]
    else
      # Handle empty query case
      @results = []
    end
  end
  def show
    recipe_id = params[:id]
    @recipe_details = SpoonacularService.new.get_recipe_information(recipe_id)
  end
end
