class RecipesController < ApplicationController
  def new
  	@recipe = Recipe.new
  end

  def create
  	@recipe = Recipe.new(recipe_params)
  	if @recipe.valid?
      @recipe.save
  	  redirect_to recipe_path(@recipe) 
  	else
  	  render 'new'
  	end
  end

  def show
  	@recipe =  Recipe.find(params[:id])
  end

  def edit
  	@recipe =  Recipe.find(params[:id])
  end

  def update
  	@recipe =  Recipe.find(params[:id])
  	@recipe.attributes= recipe_params
  	if @recipe.valid?
  	  @recipe.save
  	  redirect_to recipe_path(@recipe)
  	else
  	  render 'edit'
  	end
  end


  private
  def recipe_params
  	params.require(:recipe).permit(:name, ingredients:[])
  end


end
