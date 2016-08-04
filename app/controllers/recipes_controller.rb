class RecipesController < ApplicationController

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
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipe = Recipe.all
    if params[:search]
      @recipe = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipe = Recipe.all.order('created_at DESC')
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end
