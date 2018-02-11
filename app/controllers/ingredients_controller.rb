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
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
