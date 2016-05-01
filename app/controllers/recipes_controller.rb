class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end


  def new
    @recipe = Recipe.new
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
     recipe = Recipe.find(params[:id])
     recipe.update(recipe_params)
     redirect_to recipes_path
   end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
end
