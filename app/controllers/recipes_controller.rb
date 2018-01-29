class RecipesController < ApplicationController
 def show
    find_recipe
  end

  def index
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
    find_recipe
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end
  
  def edit
    find_recipe
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
end
