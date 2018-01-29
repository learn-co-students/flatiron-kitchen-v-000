class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    Ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render :edit
    end

  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
