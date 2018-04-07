class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      redirect_to new_recipe_path
    end
  end

  def edit
  end

  def update

    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def show
    @recipe = Recipe.new
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
