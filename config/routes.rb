FlatironKitchen::Application.routes.draw do
  get 'recipes/:id/add', to: 'recipes#add', as: 'add_recipe'
  resources :recipes, :ingredients
end
