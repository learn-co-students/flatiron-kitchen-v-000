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
			redirect_to ingredient_path(@ingredient)
		else
			render :new
		end		
	end

	def show
		set_ingredient
	end

	def edit
		set_ingredient
	end

	def update
		set_ingredient
		if @ingredient.update(ingredient_params)
			redirect_to ingredient_path(@ingredient)
		else
			render :edit
		end		
	end

	def destroy
		set_ingredient.destroy
	end

	private

	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
	end

	def ingredient_params
		params.require(:ingredient).permit(:name, :quantity)		
	end
end
