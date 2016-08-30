class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    set_recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    set_recipe
  end

  def update
    set_recipe.ingredients.clear
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
