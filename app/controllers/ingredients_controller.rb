class IngredientsController < ApplicationController

	def new
		@ingredient = Ingredient.new
	end

	def create	
		@ingredient = Ingredient.new(ingredient_params)
		
			redirect_to ingredients_path
	end

	def index
		    @ingredients = Ingredient.all

	end

	def edit
    	@ingredient = Ingredient.find(params[:id])
  	end

	private

	def ingredient_params
		params.require(:ingredient).permit(:name) 
	end

end
