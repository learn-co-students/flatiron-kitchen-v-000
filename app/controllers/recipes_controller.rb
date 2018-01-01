require 'pry'

class RecipesController < ApplicationController 
  
  def index 
    @recipes = Recipe.all
  end 
  
  def new 
    @recipe = Recipe.new
  end 
  
  def create 
    @recipe = Recipe.create(recipe_params)
    @recipe.save
    redirect_to recipes_path
  end 
  
  def show 
    #binding.pry
    set_recipe
  end 
  
  def edit 
    set_recipe 
  end 
  
  def update 
    @recipe = set_recipe 
    @recipe.update(recipe_params)
    @recipe.save
    redirect_to recipes_path
  end 
  
  private 
  
  def set_recipe 
    @recipe = Recipe.find(params[:id])
  end 
  
  def recipe_params 
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end 
  
end 