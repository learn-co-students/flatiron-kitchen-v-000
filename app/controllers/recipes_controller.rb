class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.ingredients.clear
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
