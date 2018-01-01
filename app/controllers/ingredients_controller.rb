require 'pry'

class IngredientsController < ApplicationController 
  
  def new 
    @ingredient = Ingredient.new
  end 
  
  def create  
    @ingredient = Ingredient.create(:name => params[:ingredient][:name])
    @ingredient.save 
    redirect_to ingredients_path 
  end 
  
  def show 
    @ingredient = Ingredient.find(params[:id])
  end 
  
  def index
    @ingredients = Ingredient.all 
  end 
  
  def edit 
    set_ingredient
  end 
  
  def update 
    @ingredient = set_ingredient
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path 
  end 
  
  private
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end 
  
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end 
  
end 