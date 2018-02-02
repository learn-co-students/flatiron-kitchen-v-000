class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to recipe_path(recipe)
    else
      render new
    end
  end

  def edit
    @recipe = set_recipe
  end

  def update
    @recipe = set_recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def show
    @recipe = set_recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredients_attributes => [:name])
  end

  def set_recipe
    Recipe.find(params[:id])
  end
end
