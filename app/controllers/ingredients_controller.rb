class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    if ingredient.valid?
      ingredient.save
      redirect_to ingredient_path(ingredient)
    else
      render :new
    end
  end

  def show
    set_ingredient
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient.update(ingredient_params)
    if set_ingredient.valid?
      redirect_to ingredient_path(set_ingredient)
    else
      render :edit
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end