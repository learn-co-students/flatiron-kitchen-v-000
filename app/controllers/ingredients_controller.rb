class IngredientsController < ApplicationController

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

    def index
        @ingredients = Ingredient.all
    end

    def show
        find_ingredient
    end

    def edit
        find_ingredient
    end

    def update
        find_ingredient
        @ingredient.update(ingredient_params)

        if @ingredient.save
            redirect_to @ingredient
        else
            render :edit
        end
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name, :id)
    end

    def find_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end
end
