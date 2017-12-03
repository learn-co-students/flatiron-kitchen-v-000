class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render :edit
    end
  end

  def show

  end

  private

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
