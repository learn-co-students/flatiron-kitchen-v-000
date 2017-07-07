class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find_by(:id => params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(:id => params[:id])

    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  def show
    @ingredient = Ingredient.find_by(:id => params[:id])
  end

  def destroy
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
