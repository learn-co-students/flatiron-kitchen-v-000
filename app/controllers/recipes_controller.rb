class RecipesController < ApplicationController
	before_action :set_recipe, only: [:edit, :update, :show]

	def index
		@recipes = Recipe.all
	end	

	def new
		@recipe = Recipe.new
	end

	def create 
		# binding.pry
		@recipe = Recipe.new(recipe_params)
		if @recipe.valid?
			@recipe.save
			redirect_to recipes_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	private

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params

		params.require(:recipe).permit(:name, ingredient_ids: [])
	end

end
