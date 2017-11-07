class RecipesController < ApplicationController
  before_action :set_recipe!, only: [:edit, :show, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
  end

  def set_recipe!
    @recipe = Recipe.find_by_id(params[:id])
  end
end
