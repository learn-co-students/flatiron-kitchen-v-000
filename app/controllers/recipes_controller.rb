class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    redirect_to @recipe
  end

  def show
    @recipe = find_recipe
  end

  def edit
    @recipe = find_recipe
  end

  def update
    @recipe = find_recipe
    @recipe.update(recipe_params)

    redirect_to @recipe
  end

  private

  def find_recipe
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredient_attributes: [:name])
  end
end
