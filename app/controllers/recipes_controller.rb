class RecipesController < ApplicationController
  def index

  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients => [])
  end
end
