class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipes_param)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipes_param)
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  private
    def recipes_param
      params.require(:recipe).permit(:name, recipe_ingredients_attributes: [:ingredient_id])
    end
end
