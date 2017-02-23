require 'pry'

class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]

   def index
        @recipes = Recipe.all
    end

    def show

    end

    def new
        @recipe = Recipe.new
    end

    def edit

    end

    def create
      @recipe = Recipe.find_or_create_by(recipes_params(:name, :ingredient_ids))
      # binding.pry
      if !params[:recipe][:ingredient_ids].delete_if(&:empty?).empty?
        params[:recipe][:ingredient_ids].delete_if(&:empty?).each do |ingredient_id|
        @recipe.ingredients << Ingredient.find_by(ingredient_id)
        end
      end
      # @recipe.ingredients << Ingredient.find_or_create_by(params[:recipe][:ingredient_ids][0])
      # binding.pry
      redirect_to recipe_path(@recipe)
    end

    def update
     @recipe.update(recipes_params(:name, :ingredient_ids))
     # binding.pry
     @recipe.ingredients.clear
        if !params[:recipe][:ingredient_ids].delete_if(&:empty?).empty?
        params[:recipe][:ingredient_ids].delete_if(&:empty?).each do |ingredient_id|
        @recipe.ingredients << Ingredient.find_or_create_by(ingredient_id)
        end
      end
      redirect_to recipe_path(@recipe)
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipes_params(*args)
      params.require(:recipe).permit(*args)
    end
end
