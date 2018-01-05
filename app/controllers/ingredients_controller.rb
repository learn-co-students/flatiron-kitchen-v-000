class IngredientsController < ApplicationController
  
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end
  
  def show
    set_ingredient
  end
  
  def edit
    set_ingredient
  end

  def update
    set_ingredient
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end
  
  private
  
  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end
  
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  
end
