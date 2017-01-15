class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by( params.require(:ingredient).permit(:name))
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(params.require(:ingredient).permit(:name))
    redirect_to ingredient_path(@ingredient)
  end
end
