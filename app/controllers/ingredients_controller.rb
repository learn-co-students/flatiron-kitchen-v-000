class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
  @ingredient = Ingredient.find_by(params[:id])
  @ingredient.name = ingredient_params[:name]
  @ingredient.save
  redirect_to ingredient_path(@ingredient)
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
