class IngredientsController < ApplicationController

  def show
    found
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    @ingredient.save

    redirect_to ingredient_path(@ingredient)
  end

  def update
    found
    @ingredient.update(ingredient_params)

    redirect_to ingredient_path(@ingredient)
  end

  def edit
    found
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def found
      @ingredient = Ingredient.find(params[:id])
    end
  
end