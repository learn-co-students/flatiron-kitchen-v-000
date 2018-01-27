class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def edit
    @recipe = Recipe.find_by(params[:id])
  end

  def update
    @recipe = Recipe.find_by(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end


end
