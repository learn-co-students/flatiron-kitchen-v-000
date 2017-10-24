class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.create(recipe_params)
        redirect_to @recipe
    end

    def show
        find_recipe
    end

    def edit
        find_recipe
    end

    def update
        find_recipe
        @recipe.update(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end

    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end

end
