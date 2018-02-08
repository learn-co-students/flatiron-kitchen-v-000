class RecipeController < ApplicationController
	def index 
		@recipes = Recipe.all
	end 

	def show 
		@recipe = Recipe.find(params[:id])
	end 
	def new
		@recipe = Recipe.new
		@recipe.ingredients.build
		@recipe.ingredients.build
		# ask TC about process - set up all of this, or do it  line by line? 
	end 
	 def create
	 	recipe = Recipe.create(recipe_params)
	 	redirect_to recipe
	 end 

	def update
		recipe = Recipe.find(params[:id])
		recipe.update(recipe_params)
		redirect_to recipe
	end 

	def destroy
	end 

	private

	def recipe_params
		params.require(:recipe).permit(
			:name, 
			ingredients_attributes: [
				:name,
				:quantity
				]
			)
	end 


end
