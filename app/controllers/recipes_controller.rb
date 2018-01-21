class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    get_ingredients
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    get_ingredients
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  private

  #you got stuck on this part as well. why do i need to do this again?
  def get_ingredients
    @ingredients = Ingredient.all
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
    #you got stuck on that last part fyi
  end
end
