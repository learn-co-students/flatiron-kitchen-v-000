class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    set_recipe
  end

  def new
  end

  def create
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
