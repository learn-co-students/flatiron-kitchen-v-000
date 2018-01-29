class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
    @ingredients = @recipe.ingredients
  end

  def new
    @recipe = Recipe.new
    @ingrs = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end

  def edit
    @ingrs = Ingredient.all
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render "edit"
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [], ingredients_attributes: [:name])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
