class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all 
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)

    redirect_to recipes_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end ## class end
