class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def new
    @recipe = Recipe.new
  end
  def create
  end
  def show
  end
  def edit
    @recipe = Recipe.find(recipe_params)
  end
  def update
  end
  private
  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
