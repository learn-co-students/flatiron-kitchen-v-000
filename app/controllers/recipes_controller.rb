class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build 
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

end


# // ♥ rake routes
#          Prefix Verb URI Pattern                     Controller#Action
#         recipes GET  /recipes(.:format)              recipes#index
#      new_recipe GET  /recipes/new(.:format)          recipes#new
#     edit_recipe GET  /recipes/:id/edit(.:format)     recipes#edit
#          recipe GET  /recipes/:id(.:format)          recipes#show
#     ingredients GET  /ingredients(.:format)          ingredients#index
#  new_ingredient GET  /ingredients/new(.:format)      ingredients#new
# edit_ingredient GET  /ingredients/:id/edit(.:format) ingredients#edit
#      ingredient GET  /ingredients/:id(.:format)      ingredients#show