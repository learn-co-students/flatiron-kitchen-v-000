class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:edit, :update, :show]

  def index
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(ingredients_params)
    redirect_to ingredient
  end

  def show
  end

  def edit
  end

  def update
    @ingredient.update(ingredients_params)
    redirect_to @ingredient
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end

end
