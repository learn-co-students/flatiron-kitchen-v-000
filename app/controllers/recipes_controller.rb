class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.valid? ? redirect_to(recipe_path(@recipe)) : render(:new)
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(recipe_params)
    @recipe.valid? ? redirect_to(recipe_path(@recipe)) : render(:edit)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
