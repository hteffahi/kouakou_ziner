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
end
