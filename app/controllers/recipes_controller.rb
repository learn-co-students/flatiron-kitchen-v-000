class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
    end

end
