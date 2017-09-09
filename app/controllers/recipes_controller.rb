class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

  end

  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.create(recipe_params)
         render "show"
  end
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])

  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
  end

  # def ingredient_ids=(ingredient_ids)

  # end

  private

    def recipe_params
      params.require(:recipe).permit(:name)
    end
end
