class RecipesController < ApplicationController
  before_action :select_recipe, only: [:show, :edit, :update]
  layout "recipe"

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @ingredients = @recipe.ingredients.build
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private
  def select_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
