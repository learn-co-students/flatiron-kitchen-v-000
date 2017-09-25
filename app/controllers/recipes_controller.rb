class RecipesController < ApplicationController
  before_action :load_recipes, only: [:show, :edit, :update]
  before_action :load_ingredients, only: [:new, :index, :show, :edit]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render edit_recipe_path(@recipe)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def load_recipes
    @recipe = Recipe.find(params[:id])
  end

  def load_ingredients
    @ingredients = Ingredient.all
  end
end
