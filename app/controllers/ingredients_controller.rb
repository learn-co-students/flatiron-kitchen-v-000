class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def show
    set_ingredient
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
