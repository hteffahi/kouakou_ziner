Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :ingredients
  get 'recipes/fetch', to: 'recipes#fetch'
  get '/recipes/search', to: 'recipes#search', as: 'recipes_search'
  resources :recipes, only: [:index, :show, :create, :destroy]
  get "/dashboard", to: "dashboard#profile"
end
