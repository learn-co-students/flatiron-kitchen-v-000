class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def show
     @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredients_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end

end
