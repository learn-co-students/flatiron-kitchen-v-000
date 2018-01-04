class RecipesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def update
    @recipe = set_recipe
    @recipe.name = params[:name]
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      redirect :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
