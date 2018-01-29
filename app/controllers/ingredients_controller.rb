require 'pry'

class IngredientsController < ApplicationController
      before_action :set_ingredient, only: [:show, :edit, :update]

   def index
        @ingredients = Ingredient.all
    end

    def show

    end

    def new
        @ingredient = Ingredient.new
    end

    def edit

    end

    def create
      @ingredient = Ingredient.find_or_create_by(ingredients_params(:name))
      # @ingredient = Ingredient.new(ingredients_params(:name))
      redirect_to ingredient_path(@ingredient)
    end

    def update
     @ingredient.update(ingredients_params(:name))
      redirect_to ingredient_path(@ingredient)
    end

    private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredients_params(*args)
      params.require(:ingredient).permit(*args)
    end

end
