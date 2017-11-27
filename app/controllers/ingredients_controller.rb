class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update]

  def update
    @ingredient.update(ingredient_params) ? (redirect_to @ingredient) : (render :edit)
  end

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    @ingredient.valid? ? (redirect_to @ingredient) : (render :new)
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
