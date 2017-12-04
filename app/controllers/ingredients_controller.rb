require 'pry'
class IngredientsController < ApplicationController

  def show
    find_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
    find_ingredient
  end

  def update
    find_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end


  private

  def find_ingredient
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
