class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
    #binding.pry
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    binding.pry
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :ingredient)
  end
end
