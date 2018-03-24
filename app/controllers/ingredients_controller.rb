class IngredientsController < ApplicationController

  def show
    @ingredient = ingredient.find(params[:id])
  end

  def index
    @ingredients = ingredient.all
  end

  def new
    @ingredient = ingredient.new

  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end
  end
  
  def edit
    @ingredient = ingredient.find(params[:id])
  end

  def update

    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end


private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end