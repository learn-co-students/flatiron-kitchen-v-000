require 'pry'
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.ingredients.build(ingredient_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    if params[:recipe][:ingredient_ids]
      @recipe.update(recipe_params)
    else
      params[:recipe][:ingredient_ids] = []
      @recipe.update(recipe_params)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
  end

private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :ingredient_ids => [])
  end

  def ingredient_params
    params.require(:recipe_ingredients).permit(:name)
  end
end
