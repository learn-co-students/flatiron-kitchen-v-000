class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end
	
	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

  def create
  	Recipe.create(recipe_params)
  	redirect_to recipes_path
  end

  def show
  	@recipe = Recipe.find(params[:id])
  end

  private

    def recipe_params
    	params.require(:recipe).permit(:name)
    end
end