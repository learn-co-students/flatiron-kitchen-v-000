class RecipesController < ApplicationController

  def new
  	@recipe = Recipe.new
  	@ingredients = Ingredient.all
  end


  def create
  	 Recipe.create(recipe_params) 
     	redirect_to recipes_path
  end

  def edit
  	@recipe = Recipe.find(params[:id])
  end

  def update
  	Recipe.find(params[:id]).update(recipe_params)	
  	redirect_to recipes_path
  end

  def index  
  	@recipes = Recipe.all 
  end 

  private

  def recipe_params
	params.require(:recipe).permit(:name, :ingredient_ids, []) 
  end
end
 