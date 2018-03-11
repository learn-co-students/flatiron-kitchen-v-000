class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
