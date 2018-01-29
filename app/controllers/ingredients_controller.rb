require 'pry'
class IngredientsController < ApplicationController
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params_check)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(params_check)
    redirect_to ingredient_path(@ingredient)
  end

  private

  def params_check
    params.require(:ingredient).permit(:name)
  end
end
