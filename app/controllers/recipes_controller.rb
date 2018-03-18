class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
        
    end
    
    def create
        @recipe = Recipe.create(post_params)
        
        if @recipe.save
            redirect_to @recipe
        else
            render :new
        end
    end
    
    def show
        set_recipes
    end
    
    def edit
        set_recipes
    end
    
    def update
        set_recipes.update(post_params)
        redirect_to @recipe
    end
    
    def destroy
        set_recipes.delete
        redirect_to recipes_path
    end
    
    private
    
    def set_recipes
        @recipe = Recipe.find(params[:id])
    end
    
    def post_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
