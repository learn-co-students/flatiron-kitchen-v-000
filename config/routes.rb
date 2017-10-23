FlatironKitchen::Application.routes.draw do
  resources :ingredients, only: [:index, :show, :new, :create, :edit, :update]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :update]
end
