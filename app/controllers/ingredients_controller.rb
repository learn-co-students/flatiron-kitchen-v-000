class IngredientsController < ApplicationController
before_action :set_ingredient, only: [:show, :update, :edit, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def show
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
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

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    # modify method to accept the params hash keys
    params.require(:ingredient).permit(:name, :quantity)
  end

end
