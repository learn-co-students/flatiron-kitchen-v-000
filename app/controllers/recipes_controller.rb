class RecipesController < ApplicationController
  before_action :find_ingredient, only: [:edit, :update, :show]

  def index
  end

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
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private

  def find_ingredient
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
