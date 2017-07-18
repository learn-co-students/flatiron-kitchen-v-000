class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end
  

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
  
  
end
