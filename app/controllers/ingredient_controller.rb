class IngredientController < ApplicationController

  def index 
  	@ingredients = Ingredient.all
  end 

  def show
  	@ingredient = Ingredient
  end 

  def new
  	@ingredient = Ingredient.create
  	@ingredient.recipe.build
  end 

  def create
  	@ingredient = Ingredient.new(ingredient_params)
  	redirect_to ingredient
  end 

  def update
  	ingredient = Ingredient.find(params[:id])
  	ingredient.update(ingredient_params)
  	redirect_to ingredient
  end 

  def destroy

  end 

  private

  def ingredient_params
  	params.require(:ingredient).permit(:name)
  	# add recipe_attributes: {:name}



end
