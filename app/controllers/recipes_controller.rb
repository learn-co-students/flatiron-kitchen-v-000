class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    if @recipe = Recipe.create(recipe_params)
      redirect_to recipes_path
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = Ingredient.all
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @ingredients = Ingredient.all
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render "edit"
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids:[])
    end
end
