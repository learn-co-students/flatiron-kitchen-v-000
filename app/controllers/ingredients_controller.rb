class IngredientsController < ApplicationController
	before_action :intiate_ingredient, only: [:create, :edit, :update, :show, :destroy]

	def index
		@ingredient = Ingredient.all
	end

	def new
		@ingredient = Ingredient.new
	end

	def show
		
	end

	def edit
		
	end

	def create
		@ingredient = Ingredient.create(ingredient_params)
		if @ingredient.valid?
			redirect_to ingredient_path(@ingredient.id)
		else
			render :new
		end
	end

	def update
		@ingredient.update(ingredient_params)
		if @ingredient.valid?
			redirect_to ingredient_path(@ingredient.id)
		else
			render :edit
		end 
	end

	def destroy
		
	end

	private
    
    def ingredient_params
    	params.require(:ingredient).permit(:name)
    end

	 def intiate_ingredient
	 	@ingredient = Ingredient.find_by(id: params[:id])
	 end
end
