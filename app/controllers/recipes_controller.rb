class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    render "show"
  end

  def show
    locate_recipe
  end

  def edit
    locate_recipe
  end

  def update
    locate_recipe
    @recipe.update(recipe_params)
    render "show"
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def locate_recipe
    @recipe = Recipe.find(params[:id])
  end

end
