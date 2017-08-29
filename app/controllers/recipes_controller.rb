class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def show
    @ingredients = @recipe.ingredients
  end

  private

  def recipe_params
    params.require(:recipe).permit([:name])
  end

end
