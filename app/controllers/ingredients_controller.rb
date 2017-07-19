class IngredientsController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
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

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
