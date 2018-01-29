require 'pry'

class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    redirect_to @ingredient
  end

  def show
    @ingredient = find_ingredient
  end

  def edit
    @ingredient = find_ingredient
  end

  def update
    @ingredient = find_ingredient
    @ingredient.update(ingredient_params)

    redirect_to @ingredient
  end

  private

  def find_ingredient
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
