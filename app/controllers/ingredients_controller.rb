class IngredientsController < ApplicationController
	
	def new
		@ingredient = Ingredient.new
	end
	
	def create
		@ingredient = Ingredient.new(param_permit)
		if @ingredient.save
			redirect_to ingredient_path(@ingredient)
		else
		render :new
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
		if @ingredient.update(param_permit)
			redirect_to ingredient_path(@ingredient)
		else
			render :edit
		end
	end
	
	private
	
		def param_permit
			params.require(:ingredient).permit(:name)
		end	
	
end
