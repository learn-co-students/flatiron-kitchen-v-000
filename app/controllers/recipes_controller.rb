class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    3.times do
      @ingredients = @recipe.ingredients.build
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @ingredient = @recipe.ingredients.new(params[:ingredients])
    if @recipe.save
      redirect_to action: "show"
    else
      redirect_to action: "new"
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
    end
end
