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
		if @recipe.save!
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	end

	def update
		raise params.inspect
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end

	private
		def recipe_params
			params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
		end
end