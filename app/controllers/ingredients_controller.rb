class IngredientsController < ApplicationController
	def show
	  @ingredient = Ingredient.find(params[:id])
	end

	def new 
	  @ingredient = Ingredient.new
	end

	def index
	  @ingredient = Ingredient.all
	end

	def create
      ingredient = Ingredient.create(ingredient_params)
      redirect_to ingredient
    end

    def edit
  	  @ingredient= Ingredient.find(params[:id]) 
    end


    def update
  	  @ingredient= Ingredient.find(params[:id])
      @ingredient.update(ingredient_params)
      
      redirect_to ingredient_path(@ingredient)
    end

	
	private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
