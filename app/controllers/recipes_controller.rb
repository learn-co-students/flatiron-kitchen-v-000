class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  
  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    puts recipe_path(@recipe) 
    redirect_to recipe_path(@recipe)
  end

  def show
  end


  def edit
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end


  private

  def set_recipe
     @recipe = Recipe.find(params[:id])
   end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes:[:name])
  end
end
