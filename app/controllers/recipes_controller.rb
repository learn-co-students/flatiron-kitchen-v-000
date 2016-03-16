class RecipesController < ApplicationController

  def show
    found
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.save

    redirect_to recipe_path(@recipe)
  end

  def update
    found
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end

  def edit
    found
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def found
      @recipe = Recipe.find(params[:id])
    end

end