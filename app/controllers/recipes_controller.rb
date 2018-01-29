class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
		@recipe.ingredients.build
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@recipe.ingredients.build
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save 
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
	end
end
