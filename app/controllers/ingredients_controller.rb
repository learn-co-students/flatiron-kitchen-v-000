class IngredientsController < ApplicationController
    
    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end
    
    def new
        @ingredient = Ingredient.new

    end
    
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient
        else
            render 'create'
        end
    end
    
    def edit
        @ingredient = Ingredient.find(params[:id])
    end
    
    def update
      #raise Exception.new(@ingredient.update(ingredient_params))
      @ingredient = Ingredient.find(params[:id])
      if @ingredient.update(ingredient_params)
        redirect_to @ingredient
      else
        render action: 'edit'
      end  
    end
    
    private
    
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end    
end
