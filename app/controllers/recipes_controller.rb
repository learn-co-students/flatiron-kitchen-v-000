class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
  end

  def index
    @recipes = recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredients_attributes => [:name])
  end
end
