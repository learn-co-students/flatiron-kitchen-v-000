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

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
