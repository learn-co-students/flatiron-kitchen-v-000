require 'pry'

class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
	  @recipe = Recipe.find(params[:id])
	  @recipe.update(recipe_params)
	  redirect_to recipe_path(@recipe)
	end

  def destroy
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

end
