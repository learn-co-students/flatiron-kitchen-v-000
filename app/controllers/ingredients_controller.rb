class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render :new
    end
  end

  def edit
    @ingredient = set_ingredient
  end

  def update
    @ingredient = set_ingredient

    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def show
    @ingredient = set_ingredient
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    Ingredient.find(params[:id])
  end
end
