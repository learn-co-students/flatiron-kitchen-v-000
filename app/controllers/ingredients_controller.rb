class IngredientsController < ApplicationController

	def new
		@ingredient = Ingredient.new
	end

	def create
		Ingredient.create(ingredients_params)
		redirect_to ingredients_path
	end

	def index
		@ingredients = Ingredient.all
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredients_params)
    redirect_to ingredients_path
  end
  
	private

	  def ingredients_params
	  	params.require(:ingredient).permit(:name)
	  end
end