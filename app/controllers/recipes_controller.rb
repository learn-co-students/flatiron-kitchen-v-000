class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
    end

    def create
        @recipe = Recipe.new(name: params[:recipe][:name])
        if !params[:recipe][:ingredient_ids].nil?
            params[:recipe][:ingredient_ids].each do |id|
                if !id.empty?
                    @recipe.ingredients << Ingredient.find(id)
                end
            end
        end

        if @recipe.save
            render 'show'
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @ingredients = Ingredient.all
    end

    def update
        @recipe = Recipe.find(params[:id])

        if @recipe.update(recipe_params)
            render 'show'
        end
    end

    private
        def recipe_params
            params.require(:recipe).permit(:name, ingredient_ids:[])
        end
end
