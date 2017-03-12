class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.update(params[:id], recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
end
