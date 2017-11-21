FlatironKitchen::Application.routes.draw do
  resources :recipes
  resources :ingredients
  patch 'ingredients/:id', to: 'ingredients#update'
end
