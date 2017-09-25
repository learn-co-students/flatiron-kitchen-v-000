class IngredientsController < ApplicationController
  before_action :load_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render new_ingredient_path
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render edit_ingredient_path(@ingredient)
    end
  end
  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def load_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
