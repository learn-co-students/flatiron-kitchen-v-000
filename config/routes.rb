FlatironKitchen::Application.routes.draw do

  resources :ingredients, only: [:new, :edit, :create, :update, :show]
  resources :recipes, only: [:new, :edit, :create, :update, :show]

end
