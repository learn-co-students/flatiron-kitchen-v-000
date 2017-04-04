require 'pry'
class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
    end

    def create
#        binding.pry
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render "new"
        end
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render "edit"
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def show
        @recipe = Recipe.find(params[:id])
    end
    
    private
    def recipe_params
#        binding.pry
        params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredient_attributes => [])
    end
end
