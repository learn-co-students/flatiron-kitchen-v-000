class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
