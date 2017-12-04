require 'pry'
class RecipesController < ApplicationController

  def show
    find_recipe
  end

  def new
    @recipe = Recipe.new
    3.times do
      @recipe.ingredients.build
    end
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
    find_recipe
  end

  def update
    find_recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :end
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by_id(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], :ingredients_attributes => [:name])
  end

end
