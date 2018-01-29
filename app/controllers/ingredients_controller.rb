class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_param)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "new"
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
    if @ingredient.update(ingredients_param)
      redirect_to ingredient_path(@ingredient)
    else
      render "edit"
    end
  end

  private
    def ingredients_param
      params.require(:ingredient).permit(:name)
    end
end
