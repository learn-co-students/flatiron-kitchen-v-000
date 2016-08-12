class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    Recipe.create(recipe_params)

    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])

    @all_ingredients = Ingredient.all
    @recipe_ingredients = @recipe.recipe_ingredients
    @recipe_ingredient_ids = @recipe_ingredients.map(&:ingredient_id)
  end

  def update
    recipe = Recipe.find(params[:id])

    recipe.update(recipe_params)

    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, recipe_ingredient_attrs: [:ingredient_id, :quantity])
  end
end
