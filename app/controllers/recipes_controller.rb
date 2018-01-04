class RecipesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

  def set_recipe
    @recipe = recipe.find(params[:id])
  end
end
