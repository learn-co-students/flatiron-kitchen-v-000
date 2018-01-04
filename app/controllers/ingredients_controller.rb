class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.find_or_create_by(ingredient_params)
    redirect_to ingredient
  end

  def show
    set_ingredient
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end

end
