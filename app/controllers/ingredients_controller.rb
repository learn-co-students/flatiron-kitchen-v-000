class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
  end

  def show

  end

  private

  def ingredient_params
    params.require(:ingredient).permit([:name])
  end

end
