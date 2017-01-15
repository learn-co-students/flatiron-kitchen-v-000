class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def create
    @recipe = Recipe.create(params.require(:recipe).permit(:name, :ingredient_ids => []))
    redirect_to recipe_path(@recipe)
  end
end
