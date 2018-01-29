class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ing_params)

    redirect_to ingredient_path
  end


  private
     def ing_params
       params.require(:ingredient).permit(:name)
     end
end
