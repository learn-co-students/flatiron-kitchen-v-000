class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    @ingredients = Ingredient.all
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(recipe_params)
    render :show
  end

private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
