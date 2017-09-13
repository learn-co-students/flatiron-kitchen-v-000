class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :update, :edit, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    # add two empty ingredients to fill out
    4.times do
     @recipe.ingredients.build
    end
  end

  def create
    binding.pry
    @recipe = Recipe.create(recipe_params)
    binding.pry
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    # modify method to accept the params hash keys
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name, :quantity])
  end
end
