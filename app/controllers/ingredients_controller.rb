class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredients = Ingredient.find(params[:id])
  end

  def new
    @ingredients = Ingredient.new
  end

  def create
    ingredients = Ingredient.create(ingredient_params)
    redirect_to post_path(ingredients)
  end

  def edit
    @ingredients = Ingredient.find(params[:id])
  end

 def update
    ingredients = Ingredient.find(params[:id])
    ingredients.update(ingredient_params)
    redirect_to post_path(ingredients)
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
