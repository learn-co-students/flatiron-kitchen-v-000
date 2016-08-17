require 'pry'
class IngredientsController < ApplicationController
  
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    @ingredient.name = params[:name]
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    
  end

  def update
    #binding.pry
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(ingredient_params)
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
