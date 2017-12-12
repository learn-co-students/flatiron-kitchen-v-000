class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
    end
    
    def create
        
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            flash[:notice] = "Recipe Created!"
            redirect_to recipe_path(@recipe)
        else
            flash[:notice] = "There was a problem creating your recipe"
            render 'new'
        end
       
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def edit
        @recipe=Recipe.find(params[:id])
    end
    
    def update
       @recipe=Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            flash[:notice] = "Recipe updated!"
            redirect_to recipe_path(@recipe)
        else
            flash[:notice] = "There was a problem editing your recipe"
            render 'edit'
        end
    end
    
    
    
    
    private
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
    
end
