class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
