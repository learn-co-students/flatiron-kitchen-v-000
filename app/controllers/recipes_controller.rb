class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipes_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipes_params)
      redirect_to recipe_path(@recipe)
    else
      render "edit"
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
