class IngredientsController < ApplicationController
  layout "ingredients"

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def update
    @ingredient = Ingredient.find_by_id(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
