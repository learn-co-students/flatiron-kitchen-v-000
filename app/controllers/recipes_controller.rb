class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
		@ingredients = Ingredient.all
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to root_path
		else
			render :new
		end
	end

	private

		def recipe_params
			params.require(:recipe).permit(:name, ingredient_attributes: [])
		end
end