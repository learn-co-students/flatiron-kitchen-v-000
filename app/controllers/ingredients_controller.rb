class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(id: params[:id])
  end
end
