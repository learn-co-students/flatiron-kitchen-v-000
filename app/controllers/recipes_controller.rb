require 'pry'
class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		binding.pry
		redirect_to @recipe
	end

	def show
		find_recipe
	end

	def edit
		find_recipe
	end

	def update
		@recipe = find_recipe
		@recipe.update(recipe_params)
		redirect_to @recipe
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, ingredient_ids: [])
		end

		def find_recipe
			@recipe = Recipe.find(params[:id])
		end
end
