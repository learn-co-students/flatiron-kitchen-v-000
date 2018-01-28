require 'pry'
class IngredientsController < ApplicationController
  def new
    @ingredient=Ingredient.new
  end

  def create
    @ingredient=Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def show
    @ingredient=Ingredient.find(params[:id])
  end

  def edit
    @ingredient=Ingredient.find(params[:id])
  end

  def update
    #binding.pry
    @ingredient=Ingredient.update(params[:id],ingredient_params)
    redirect_to @ingredient
  end



  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
