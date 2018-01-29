class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update((recipe_params))
      redirect_to @recipe
    else
      render :edit
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
