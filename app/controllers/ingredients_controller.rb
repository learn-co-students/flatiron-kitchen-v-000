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
      render 'new'
    end
  end

  def update
    @ingredient.name = params["ingredient"]["name"]
    @ingredient.save
    redirect_to @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
