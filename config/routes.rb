FlatironKitchen::Application.routes.draw do
  resources :recipes

  resources :ingredients

  resources :recipe_ingredients
end
