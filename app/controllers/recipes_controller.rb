class RecipesController < ApplicationController
	before_action  :set_recipe, only: [:show, :edit, :update]

	def index 
		@recipes = Recipe.all
	end 

	
	def new
		@recipe = Recipe.new
		# @recipe.ingredients.build
		# @recipe.ingredients.build
		# ask TC about process - set up all of this, or do it  line by line? 
	end 
	 def create
	 	@recipe = Recipe.new(recipe_params)
	 	if @recipe.save
		 	redirect_to recipe_path(@recipe)
		else 
			render :new
		end 
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

	def destroy
	end 

	private

	def recipe_params
		params.require(:recipe).permit(:name) 
			# ingredients_attributes: [
			# 	:name,
			# 	:quantity
			# 	]
			
	end 

	def set_recipe
		@recipes = Recipe.find(params[:id])
	end 

end
