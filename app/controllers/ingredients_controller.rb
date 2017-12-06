class IngredientsController < ApplicationController

  def show
    @ingredient = Ingredient.find(params[:id])
  end
  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      redirect_to new_ingredient_path
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    if ingredient.update(ingredient_params)
      redirect_to ingredient_path(ingredient)
    else
      redirect_to edit_ingredient_path
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
