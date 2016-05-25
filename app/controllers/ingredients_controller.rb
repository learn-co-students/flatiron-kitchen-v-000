class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show
  end


private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
