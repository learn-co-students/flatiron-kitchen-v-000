class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :update, :edit, :destroy]

  def index
    @recipes = Recipe.order(:name)
  end

  def show
    @ingredients = @recipe.ingredients.order(:name)
  end

  def new
    @recipe = Recipe.new
    # add empty ingredients to fill out
    4.times do
     @recipe.ingredients.build
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    # add empty ingredients to fill out
    4.times do
     @recipe.ingredients.build
    end
  end

  def update
	  if @recipe.update(recipe_params)
	     redirect_to @recipe
     else
       render :edit
     end
	end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    # modify method to accept the params hash keys
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name, :quantity])
  end
end
