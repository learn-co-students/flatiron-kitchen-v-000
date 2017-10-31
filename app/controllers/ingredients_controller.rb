class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
  
  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
