class IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.all
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			redirect_to @ingredient
		else
			new_ingredient_path
		end
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		@ingredient = Ingredient.find(params[:id])
		if @ingredient.update(ingredient_params)
			redirect_to @ingredient
		else
			edit_ingredient_path(@ingredient)
		end
	end


	private

	def ingredient_params
		params.require(:ingredient).permit(:name, :quantity)
	end

end



