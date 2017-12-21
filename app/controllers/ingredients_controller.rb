class IngredientsController < ApplicationController

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.create(ingredient_params)
        redirect_to @ingredient
    end

    def edit
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    def update
        @ingredient = Ingredient.find_by(id: params[:id])
        @ingredient.update(ingredient_params)
        redirect_to @ingredient
    end

    def show
        @ingredient = Ingredient.find_by(id: params[:id])
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
    
end
