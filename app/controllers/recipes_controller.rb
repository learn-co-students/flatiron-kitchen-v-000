class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save!
      redirect_to @recipe
    else
      redirect_to @recipes
    end
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def edit
    @ingredients = Ingredient.all
  end

  def show
    @ingredients = @recipe.ingredients
  end

  def destory
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
  end

end
