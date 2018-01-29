class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new 
  end

  def edit
    @recipe = Recipe.all.find_by(params[:id])
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    if @recipe.save 
      @recipe.save 
      redirect_to @recipe 
    else 
      render 'new'
    end 
  end 
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      @recipe.save
      redirect_to @recipe 
    else 
      render 'edit'
    end 
  end 
  
  def show 
    @recipe = Recipe.find(params[:id])
  end 

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end 
  
  
end
