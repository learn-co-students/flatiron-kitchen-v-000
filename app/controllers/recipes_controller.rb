class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show]

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

  def index
    @recipes = Recipe.all
  end

  def edit
  end

  def update
    @recipe.name = params[:recipe][:name]
    @recipe.ingredient_ids = params[:recipe][:ingredient_ids]
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def show
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
