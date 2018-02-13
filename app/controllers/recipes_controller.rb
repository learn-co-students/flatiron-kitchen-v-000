class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)

    @recipe.save

    redirect_to @recipe
  end

  def update
    @recipe.update(post_params)

    redirect_to @recipe
  end

  private

  def post_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
