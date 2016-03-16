class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(ingredient_params)
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
