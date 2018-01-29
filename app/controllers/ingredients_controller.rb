class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
  end

  def create
    @ingredient = Ingredient.create(ingredients_params)
    redirect_to ingredient_path(@ingredient)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredients_params)
    redirect_to ingredient_path(@ingredient)
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end


end
