class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    set_recipe
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
    set_recipe
    @all_ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    set_recipe
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
