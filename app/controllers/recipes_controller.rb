class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render :edit
    end
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
