FlatironKitchen::Application.routes.draw do
  resources :recipes
  resources :ingredients

  get 'recipes/:id/cook', to: 'recipes#cook', as: 'cook'
end
