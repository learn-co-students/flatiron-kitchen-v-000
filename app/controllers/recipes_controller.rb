class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
  end

  def show
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipe
    else
      render :new
    end
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], :ingredients_attributes => [:id, :qty, :name, :in_pantry, :_destroy])
  end

end
