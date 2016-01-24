class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def edit
    find_recipe
    @ingredients = Ingredient.all
  end

  def update
    find_recipe
    @recipe.update(recipe_params)
    @recipe.save
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
