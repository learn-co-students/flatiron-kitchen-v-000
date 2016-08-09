class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save

    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipe_path(@recipe)
  end


  private
      def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
      end
end
