class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    Ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredients_path
  end



  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
