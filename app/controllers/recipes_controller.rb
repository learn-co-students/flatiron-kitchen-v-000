class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new()
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end
