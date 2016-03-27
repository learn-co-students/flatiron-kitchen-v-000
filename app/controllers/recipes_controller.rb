class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]
  
  def index 
    @recipes = Recipe.all 
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else 
      @recipes = Recipe.all
    end
  end
  
  def show 
    
  end
  
  def new 
    @recipe = Recipe.new
  end
  
  def create 
    @recipe = Recipe.new(recipe_params)
    if @recipe.save 
      redirect_to recipe_path(@recipe)
    else 
      render :new
    end
  end
  
  def edit 
    
  end
  
  def update 
    # raise params.inspect
    if @recipe.update(recipe_params) 
      redirect_to recipe_path(@recipe) 
    else
      render :edit 
    end
  end
  
  
  private 
  
  def set_recipe 
    @recipe = Recipe.find(params[:id])
  end 
  
  def recipe_params 
    params.require(:recipe).permit(:name, recipe_ingredients_attributes: [:recipe_id, :quantity], ingredient_ids: [])
  end
end
