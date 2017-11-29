class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def show
    ingredient_setter
  end

  def edit
    ingredient_setter
  end

  def update
    ingredient_setter
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  private

  def ingredient_setter
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
