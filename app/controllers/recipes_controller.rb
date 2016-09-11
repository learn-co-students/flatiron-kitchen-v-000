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
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @all_ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
