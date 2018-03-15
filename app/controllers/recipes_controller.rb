class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[show edit]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end


  def create
    recipe = Recipe.new(strong_params)
    return render :new unless recipe.save
    redirect_to recipe
  end

  def update

  end

  private
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def strong_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
