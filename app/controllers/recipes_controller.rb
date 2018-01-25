class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

def index
  @recipes = Recipe.all
end

def show
end

def new
  @recipe = Recipe.new
end

def edit
end

def create
  @recipe = Recipe.new(recipe_params)

  if @recipe.save
    redirect_to recipe_path(@recipe)
  else
    render :new
  end
end

def update
  @recipe.update(recipe_params)

  if @recipe.save
    redirect_to recipe_path(@recipe)
  else
    render :edit
  end
end

def destroy
  @recipe.destroy
  redirect_to recipes_url
end

private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
