class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if
    @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def show
    @recipe= Recipe.find_by(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipes_path
  end

  def index
    @recipes = Recipe.all
  end

  private

def recipe_params
  params.require(:recipe).permit(:name, :ingredient_ids => [])
end

end
