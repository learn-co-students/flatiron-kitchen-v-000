class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [], :ingredients_attributes => [:id, :qty, :name, :in_pantry, :_destroy,] )
    end
end
