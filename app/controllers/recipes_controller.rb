class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render action: 'new'
        end
    end

    def show
        @recipe = Recipe.find_by(params[:id])
    end

    def edit
        @recipe = Recipe.find_by(params[:id])
    end

    def update
        @recipe = Recipe.find_by(params[:id])
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render action: 'edit'
        end
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredient_attributes => [:name])
    end
end