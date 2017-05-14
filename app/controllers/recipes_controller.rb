require 'pry'
class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find_by(params[:id])
  end

  def update
    @recipe = Recipe.find_by(params[:id])
    @recipe = Recipe.update(recipe_params)
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients_ids: [], ingredients_attributes: [:name])
  end
end
