class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe has been created."
      redirect_to @recipe
    else
      flash.now[:alert] = "Recipe has not been created."
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    flash[:notice] = "Recipe has been updated."
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
