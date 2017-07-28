class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.create(ingredient_params)
    @ingredient.valid? ? redirect_to(ingredient_path(@ingredient)) : render(:new)
  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(ingredient_params)
    @ingredient.valid? ? redirect_to(ingredient_path(@ingredient)) : render(:edit)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
