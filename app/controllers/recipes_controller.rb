class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
# @recipe.ingredients.create(params['recipe_name'])
    if @recipe.save

      redirect_to @recipe
    else

      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    # redirect_to recipe_url
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

  def recipe_params
    params.require(:recipe).permit(:name, :id, ingredients:[], ingredient_ids:[])
  end
end
