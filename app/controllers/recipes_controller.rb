class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.valid? ? (redirect_to @recipe) : (render :new)
  end

  def update
    @recipe.update(recipe_params) ? (redirect_to @recipe) : (render :edit)
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
