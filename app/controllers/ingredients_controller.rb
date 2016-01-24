class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    render "show"
  end

  def show
    locate_ingredient
  end

  def edit
    locate_ingredient
  end

  def update
    locate_ingredient
    @ingredient.update(ingredient_params)
    render "show"
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def locate_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
