class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ing_params)
    redirect_to ingredients_path
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(params[:id])
    @ingredient.update(ing_params)
    redirect_to ingredients_path
  end

private
  def ing_params
   params.require(:ingredient).permit(:name)
  end

end
