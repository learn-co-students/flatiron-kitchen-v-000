FlatironKitchen::Application.routes.draw do
  resources :recipe_ingredients

  resources :recipes

  resources :ingredients

  root 'recipes#index'

end
