class IngredientsController < ApplicationController
  before_action :find_ingredient, only: %i[show edit update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(strong_params)
    return render :new unless @ingredient.save
    redirect_to @ingredient
  end

  def update
    return render :edit unless @ingredient.update(strong_params)
    redirect_to @ingredient
  end

  private
  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def strong_params
    params.require(:ingredient).permit(:name)
  end
end
