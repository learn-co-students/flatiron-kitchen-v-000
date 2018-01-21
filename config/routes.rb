FlatironKitchen::Application.routes.draw do
  resources :ingredients, only: [:new, :create, :show, :edit, :update]
  resources :recipes, only: [:new, :create, :show, :edit, :update]
end
