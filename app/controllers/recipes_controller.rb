class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def show
  end

  def edit
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    save_recipe(@recipe)
  end

  def update
    @recipe.update(recipe_params)
    save_recipe(@recipe)
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredients_ids => [])
    end

    def save_recipe(recipe)
      if recipe.save
        redirect_to recipe
      else
        redirect_to new_recipe_path(recipe)
      end
    end
end
