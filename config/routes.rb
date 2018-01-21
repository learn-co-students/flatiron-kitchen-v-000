FlatironKitchen::Application.routes.draw do
  root 'recipes#index'
  
  resources :ingredients

  resources :recipes
end

# get '/recipes/new' route is mapped to #new action (method) in RecipesController,
# which renders the form to create a new recipe

# get '/recipes/:id' route is mapped to #show action (method) in RecipesController,
# which renders the show page to display the recipe whose id attribute value is stored in params[:id]
