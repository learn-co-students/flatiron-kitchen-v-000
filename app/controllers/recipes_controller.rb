class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  def show
    set_recipe
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end



end
