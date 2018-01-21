class IngredientsController < ApplicationController
    
    def new
        @ingredient=Ingredient.new(name: "ingredient1")
    end
    
    def edit
        @ingredient=Ingredient.find(params[:id])
    end
    
    def create
        #binding.pry
        @ingredient=Ingredient.new(ingredients_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            flash[:notice] = "There was a problem saving your ingredient"
            render 'new'
        end
    end
    
    def update
        @ingredient=Ingredient.find(params[:id])
        if @ingredient.update(ingredients_params)
            redirect_to ingredient_path(@ingredient)
        else
           flash[:notice] = "There was a problem editing your ingredient"
            render 'edit' 
        end
    end
    
    def show
        @ingredient=Ingredient.find_by(id: params[:id])
    end

    private
    
    def ingredients_params
        params.require(:ingredient).permit(:name)
    end
   
    
end
