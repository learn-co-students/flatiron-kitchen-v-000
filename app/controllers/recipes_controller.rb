class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  before_action :set_ingredients, only: [:new, :edit]

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
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def set_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

end
