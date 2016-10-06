class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    redirect_to ingredient_path(@ingredient)
  end

  def show
    find
  end

  def edit
    find
  end

  def update
    find
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  private

  def find
    @ingredient = Ingredient.find_by(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
