class IngredientsController < ApplicationController

    before_action :set_ingredient!, only: [:show, :edit, :update, :destroy]

    def index
        @ingredients = Ingredient.all 
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
    end

    def destroy
        @ingredient.destroy
        redirect_to ingredients_path
    end


    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient!
        @ingredient = Ingredient.find(params[:id])
    end
end
