class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
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
    @ingredient.update(ingredient_params)
    redirect_to @ingredient
  end

private
def ingredient_params
  params.require(:ingredient).permit(:name)
end

end
