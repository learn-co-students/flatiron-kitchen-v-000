class RecipesController < ApplicationController
	
	def new
		@recipe = Recipe.new
	end
	
	def create
		@recipe = Recipe.new(post_params)
		if @recipe.save
			redirect_to recipe_path(@recipe)
		else
			render 'new'
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
		if @recipe.update(post_params)
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end
	
	private
	
		def post_params
			params.require(:recipe).permit(:name, :ingredient_ids => [])
		end
	
end
