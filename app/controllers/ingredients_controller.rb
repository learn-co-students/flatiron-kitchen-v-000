class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
    render :new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    render :show
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def update
    @ingredient = Ingredient.find_or_create_by(params[:id])
    @ingredient.update(ingredient_params)
    render :show
  end

private
    def ingredient_params
      params.require(:ingredient).permit(:name, :id)
    end
end
