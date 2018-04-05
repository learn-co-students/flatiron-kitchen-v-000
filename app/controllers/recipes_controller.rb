class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
    
      redirect_to ingredients_path
    else
      redirect_to new_ingredient_path
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
