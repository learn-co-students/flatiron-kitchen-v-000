class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    @ingredients = Ingredient.all
  end

  def index
    @ingredient = Ingredient.all
    @ingredients = Ingredient.all
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
