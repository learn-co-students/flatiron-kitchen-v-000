class RecipiesController < ApplicationController
  def index
    @recipies = Recipie.all
  end

  def new
    @recipie = Recipie.new
    @ingredients = Ingredient.all
  end

  def edit
    @recipie = Recipie.find(params[:id])

    @all_ingredients = Ingredient.all
    @recipe_ingredients = @recipe.ingredients
  end

  def update
    recipie = Recipie.find(params[:id])
    recipie.update(recipie_params)

    redirect_to recipies_path
  end

  def create
    Recipie.create(recipie_params)

    redirect_to recipies_path
  end

  private

  def recipie_params
    params.require(:recipie).permit(:name, ingredient_ids: [])
  end
end
