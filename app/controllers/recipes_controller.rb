class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(rec_params)
    if @recipe.save
      redirect_to recipes_path
    else
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(rec_params)

    if @recipe.save
      redirect_to recipes_path
    else
      redirect_to edit_recipe_path(@recipe)
    end

  end

  private

  def rec_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end
end
