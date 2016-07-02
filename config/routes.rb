FlatironKitchen::Application.routes.draw do
  resources :recipes, only: [:index, :create, :new, :show, :update, :edit]
  resources :ingredients, only: [:index, :create, :new, :show, :update, :edit]

end
