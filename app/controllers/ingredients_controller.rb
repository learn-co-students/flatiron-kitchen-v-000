class IngredientsController < ApplicationController
	before_action :set_ingredient, only: [:edit, :update, :show]

	def index
		@ingredients = Ingredient.all
	end	

	def new
		@ingredient = Ingredient.new
	end

	def create 
		# binding.pry
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.valid?
			@ingredient.save
			redirect_to ingredients_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @ingredient.update(ingredient_params)
			redirect_to ingredient_path(@ingredient)
		else
			render 'edit'
		end
	end


	private

	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
	end

	def ingredient_params

		params.require(:ingredient).permit(:name)
	end

end
