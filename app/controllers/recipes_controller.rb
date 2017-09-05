class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = Recipe.new(name: params[:recipe][:name])
        if @recipe.save
            render 'show'
        end
    end
end
