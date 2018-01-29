class IngredientsController < ApplicationController

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(name: params[:ingredient][:name])
        if @ingredient.save
            render 'show'
        end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.name = params[:ingredient][:name]
        if @ingredient.save
            render 'show'
        end
    end
end
