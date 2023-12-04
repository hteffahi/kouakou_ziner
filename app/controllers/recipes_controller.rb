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

  def fetch
    my_query = params[:query].gsub(',', ',+')
    @recipe_details = SpoonacularService.new.get_by_ingredients(my_query)
    @recipes = @recipe_details.parsed_response
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :summary)
  end

end
 