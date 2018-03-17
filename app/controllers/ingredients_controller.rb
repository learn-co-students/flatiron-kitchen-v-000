class IngredientsController < ApplicationController
    
    def index
    end
    
    def new
        @ingredient = Ingredient.new
    end
    
    def create
        @ingredient = Ingredient.create(post_params)
        
        if @ingredient.save
            redirect_to @ingredient
        else
            render :new
        end
    end
    
    def show
        set_ingredients
    end
    
    def edit
        set_ingredients
    end
    
    def destroy
        set_ingredients.destroy
        redirect_to ingredients_path
    end
    
    private
    
    def set_ingredients
        @ingredient = Ingredient.find(params[:id])
    end
    
    def post_params
        params.require(:ingredient).permit(:name)
    end
end
