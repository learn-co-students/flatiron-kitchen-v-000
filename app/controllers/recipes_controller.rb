class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

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

  def update
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def edit
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
