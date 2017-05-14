FlatironKitchen::Application.routes.draw do
  
  get '/', to: 'application#index'
  resources :recipes
  resources :ingredients
end
