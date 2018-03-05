class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipes = Recipe.all
  end

  def create
    Recipe.create(recipe_params)
    redirect_to new_recipe_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipes = Recipe.all
    @ingredients = Ingredient.all
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to edit_recipe_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
