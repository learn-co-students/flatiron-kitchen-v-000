class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params(:name, ingredient_ids: []))
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params(:name, ingredient_ids: []))
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end

end
