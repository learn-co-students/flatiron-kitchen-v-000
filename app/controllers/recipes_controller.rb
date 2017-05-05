require 'pry'
class RecipesController < ApplicationController
	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

#		@recipe.save ? redirect_to @recipe : render "new" - Why doesn't short hand work?

		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
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
