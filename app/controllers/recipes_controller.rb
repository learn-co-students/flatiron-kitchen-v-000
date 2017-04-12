class RecipesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def create
    Recipe.create(r_params)
    redirect_to recipes_path
  end

  def update
    if @recipe.update(r_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private
  def r_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

  def set_article
    @recipe = Recipe.find(params[:id])
  end
end
