FlatironKitchen::Application.routes.draw do
  resources :recipe_ingredients

  resources :ingredients

  resources :recipes

  root 'application#index'
end
