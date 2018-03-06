class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

   def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.ingredients = []
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, recipe_ingredients_attributes:[:ingredient_id, :quantity])
  end
end
