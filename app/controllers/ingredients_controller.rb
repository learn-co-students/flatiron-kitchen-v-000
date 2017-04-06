class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def update
    @ingredient = Ingredient.find_by_id(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def edit
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def index
    @ingredient = Ingredient.all
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
