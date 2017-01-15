class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    #binding.pry
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    #binding.pry
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    #binding.pry
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    #binding.pry
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    Recipe.update(params[:id], recipe_params)
    redirect_to @recipe
    #binding.pry
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, ingredient_ids:[])
  end
end
