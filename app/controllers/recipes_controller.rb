class RecipesController < ApplicationController
  def new
    @recipe=Recipe.new
    #@recipe.ingredients.build
  end

  def create
    @recipe=Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def edit
    @recipe=Recipe.find(params[:id])
  end

  def show
    @recipe=Recipe.find(params[:id])
  end

  def update
    @recipe=Recipe.update(params[:id], recipe_params)
    redirect_to @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
