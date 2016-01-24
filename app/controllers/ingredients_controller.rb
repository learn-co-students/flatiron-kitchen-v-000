class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    Ingredient.find_or_create_by(ingredients_params)
    redirect_to ingredients_path
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredients_params)

    redirect_to ingredients_path
  end

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end

end
