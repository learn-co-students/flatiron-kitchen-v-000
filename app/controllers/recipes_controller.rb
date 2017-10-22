class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    set_recipe
    @recipe.assign_attributes(post_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def edit
    set_recipe
  end

  def show
    set_recipe
  end

  def index
    @recipes = Recipe.all
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def post_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
