class RecipesController < ApplicationController
  before_action :get_ingredients, only: [:new, :edit]
  before_action :find_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe
  end

  def show
  end

  def edit
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def get_ingredients
      @ingredients = Ingredient.all
    end

    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

end
