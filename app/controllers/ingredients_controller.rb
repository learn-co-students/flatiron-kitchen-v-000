class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def create
    Ingredient.create(ingredient_params)
    redirect_to new_ingredient_path
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @ingredients = Ingredient.all
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredient_params)
    redirect_to edit_ingredient_path
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
