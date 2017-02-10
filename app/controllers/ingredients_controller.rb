class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      redirect_to new_ingredient_path
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ing_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      redirect_to edit_ingredient_path(@ingredient)
    end
  end

  private

  def ing_params
    params.require(:ingredient).permit(:name)
  end
end
