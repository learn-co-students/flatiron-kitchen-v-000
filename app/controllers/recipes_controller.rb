class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def update
  end

  def edit
  end

  def show
  end

  def destory
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit([:name])
  end

end
