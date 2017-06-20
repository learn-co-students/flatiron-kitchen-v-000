class RecipesController < ApplicationController
    before_action(:initiat_recipe, only: [:show, :edit, :update, :destroy])

	def new
		@recipe = Recipe.new
	end
    
    def show	
	end

	def index
		
	end

	def edit
	end

	def create
		@recipe = Recipe.create(recipe_params)
        if @recipe.valid?
        	redirect_to(recipe_path(@recipe.id))
        else
        	render :new
        end
	end

	def update
		@recipe.update(recipe_params)
		if @recipe.valid? 
			redirect_to recipe_path(@recipe.id)
		else
			render :edit
		end
	end

	def destroy	
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :ingredient_ids => [])
	end

	def initiat_recipe
		@recipe = Recipe.find_by(id: params[:id])
	end
end
