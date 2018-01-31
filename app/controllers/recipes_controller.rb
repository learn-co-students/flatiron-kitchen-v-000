require 'pry'
class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    #@recipe.ingredients.build(name:' ')
  end

  def create
    #raise params.inspect
    @recipe = Recipe.new(recipe_params)
    #binding.pry
    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipes_path
    end
  end

  def show
    @recipe = find_by_params_id
  end

  def edit
    @recipe = find_by_params_id
  end

  def update
    @recipe = find_by_params_id
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def find_by_params_id
    Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids=>[])#, ingredients_attributes:[:name])
  end
end
