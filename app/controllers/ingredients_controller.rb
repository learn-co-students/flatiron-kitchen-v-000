class IngredientsController < ApplicationController
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
    @ingredients = Ingredient.all
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render :edit
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
