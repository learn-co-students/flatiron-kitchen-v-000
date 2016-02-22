class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    #binding.pry
    @recipe = Recipe.create(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
