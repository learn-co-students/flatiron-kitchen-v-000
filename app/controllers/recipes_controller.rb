class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
		# 10.times { @recipe.ingredients.build }
	end

	def create
		@recipe = Recipe.new(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
	end

	def show 
		@recipe = Recipe.find(params[:id])
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	end

	def update
		@recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)
		@ingredients = @recipe.ingredients


		if @recipe.save
			redirect_to @recipe
		else
			render :edit
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to recipes_path
	end

	private	
	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids: [])
	end
end
