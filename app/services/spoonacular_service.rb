# app/services/spoonacular_service.rb

class SpoonacularService
  include HTTParty
  base_uri 'https://api.spoonacular.com'

  def initialize
    @api_key = SPOONACULAR_API_KEY
  end

  def search_recipes(query)
    options = { query: { apiKey: @api_key, query: query } }
    self.class.get("/recipes/complexSearch", options)
  end
  
  def get_recipe_information(id)
    options = { query: { apiKey: @api_key } }
    self.class.get("/recipes/#{id}/information", options)
  end
end
