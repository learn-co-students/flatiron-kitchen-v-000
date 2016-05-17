class RecipesController < ApplicationController

	before_action :set_recipe, only: [:show,:edit, :update]

	def new 
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit
		
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients_ids => [])
	end
end
