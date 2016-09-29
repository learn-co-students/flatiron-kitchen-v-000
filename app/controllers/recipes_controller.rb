class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
