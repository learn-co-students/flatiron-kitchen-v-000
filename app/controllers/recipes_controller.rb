class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def index
    @recipes = Recipe.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

end
