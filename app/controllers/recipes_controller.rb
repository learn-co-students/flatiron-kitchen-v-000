class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all 
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
			redirect_to recipe_path(@recipe)
		else
			render :new
		end
	end

	def edit
	 	@recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	end

	def update
		@recipe = Recipe.find(params[:id])

		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_params: [:name])
	end
end
