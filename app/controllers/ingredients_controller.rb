require 'pry'

class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
	  @ingredient = Ingredient.find(params[:id])
	  @ingredient.update(ingredient_params)
	  redirect_to ingredient_path(@ingredient)
	end

  def destroy
  end

  def index
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
