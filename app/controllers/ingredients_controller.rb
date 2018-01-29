class IngredientsController < ApplicationController
  before_action :set_ingredient, only:[:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    redirect_to @ingredient
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

  def edit
  end

  def show
  end

  def destory
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
