require "pry"

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe.valid?
      @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.valid?
      @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find_by(:id => params[:id])  
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])#, :ingredients_attributes => [:name])
    end
end
