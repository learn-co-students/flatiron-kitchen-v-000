class RecipesController < ApplicationController
	before_action  :set_recipe, only: [:show, :edit, :update]

	def index 
		@recipes = Recipe.all
		
	end 

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end 

	def create
	 	@recipe = Recipe.new(recipe_params)
	 	if @recipe.save
	 		redirect_to recipes_path
		 	# redirect_to recipe_path(@recipe)
		else 
			render :new
		end 
	end 

	# def show 
	# 	# @recipe = Recipe.find(params[:id])
	# 	  # @recipe.ingredients = Ingredients.all
	# end 

	def edit 
		# @recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	
	end 

	def update
		# @recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)

		if @recipe.save 
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end 
	end 

	def destroy
	end 

	private

	def recipe_params
		params.require(:recipe).permit(:name, ingredients_ids:[])
	end
			# ingredients_attributes: [
			# 	:name,
			# 	:quantity (need to add this to migration? )
			# 	]
			# or simpler: ingredients_ids
	

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end 

end
