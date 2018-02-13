class IngredientsController < ApplicationController

  def name
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.search(params[:name])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredient_params)
      redirect_to ingredient
  end

 private


  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
