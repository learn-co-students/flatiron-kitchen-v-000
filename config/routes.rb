FlatironKitchen::Application.routes.draw do
  get 'ingredients/index'

  get 'ingredients/new'

  get 'ingredients/create'

  get 'ingredients/edit'

  get 'ingredients/udpate'

  get 'recipes/index'

  get 'recipes/new'

  get 'recipes/create'

  get 'recipes/edit'

  get 'recipes/udpate'

  resources :ingredients
  resources :recipes
end
