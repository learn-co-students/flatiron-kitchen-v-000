class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "Sugar")
    @recipe.ingredients.build(name: "Salt")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [], ingredients_attributes: [:name])
    end
end
