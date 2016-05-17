class IngredientsController < ApplicationController

	before_action :set_ingredient, only: [:show,:edit, :update]

	def new 
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.create(ingredient_params)
		if @ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
			render :new
		end
	end


	def edit
		@ingredient = Ingredient.find(params[:id])
	end

	def update
		@ingredient.update(ingredient_params)
		if @ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
			render :edit
		end
	end


	def show
		
	end


	private

	def ingredient_params
		params.require(:ingredient).permit(:name, :ingredients_ids => [])
	end

	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
	end

end

