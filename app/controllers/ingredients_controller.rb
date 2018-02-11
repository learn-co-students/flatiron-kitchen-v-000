class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update]
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

  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
