FlatironKitchen::Application.routes.draw do
  resources :recipes, :ingredients, only: [:show, :new, :create, :edit, :update]
end
