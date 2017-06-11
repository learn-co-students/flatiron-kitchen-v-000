class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def create
    ing = Ingredient.create(post_params)
    ing.save ? redirect_to(ingredients_path) : render(:new)
  end

  def update
    ingredient = Ingredient.find_by(id: params[:id])
    ingredient.update(post_params)
    ingredient.save ? redirect_to(ingredients_path) : render(:edit)
  end

  private
  def post_params
    params.require(:ingredient).permit(:name)
  end
end
