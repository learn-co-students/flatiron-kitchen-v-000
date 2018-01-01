class RecipesController < ApplicationController
    
    def new
        @recipe = Recipe.new
    end 
     
    def create
        # binding.pry
        @recipe = Recipe.create(recipe_params)
        redirect_to @recipe
    end
    
    def show
         @recipe = Recipe.find(params[:id])
    end 
    
    def edit 
        @recipe = Recipe.find(params[:id])
    end 
    
    def update 
        @recipe = Recipe.find(params[:id])
         
        if @recipe.update(recipe_params)
         redirect_to @recipe
        else 
         render 'edit'
        end 
        
    end 
    
    
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids:[])
    end 

end
