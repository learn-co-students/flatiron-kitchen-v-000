class RecipesController < ApplicationController
  before_action :set_recipe!, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)

    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_recipe!
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredient_attributes: [:name])
  end
end
