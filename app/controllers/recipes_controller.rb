class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update]
  before_action :get_ingredients, only: [:new, :edit]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def get_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes:[:name])
  end
end
