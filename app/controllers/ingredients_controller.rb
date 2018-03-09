class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingr_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingr_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    end
  end

  private

  def ingr_params
    params.require(:ingredient).permit(:name)
  end
end
