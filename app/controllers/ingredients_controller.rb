require 'pry'
class IngredientsController < ApplicationController
	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)

		if @ingredient.save
			redirect_to @ingredient
		else
			render 'new'
		end
	end

	def show
		find_ingredient
	end

	def edit
		find_ingredient
	end

	def update
		@ingredient = find_ingredient

		if @ingredient.update(ingredient_params)
			redirect_to @ingredient
		else
			render 'edit'
		end
	end

	private
		def ingredient_params
			params.require(:ingredient).permit(:name)
		end

		def find_ingredient
			@ingredient = Ingredient.find(params[:id])
		end
end
