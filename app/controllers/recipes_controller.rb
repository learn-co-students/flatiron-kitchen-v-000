class RecipesController < ApplicationController
    before_action :find_recipe, only: [:edit, :update, :show]

    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        @recipe.assign_attributes(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end
    
    def show
    end

    private

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end
    
end
