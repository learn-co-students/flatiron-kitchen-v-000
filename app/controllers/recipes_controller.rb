class RecipesController < ApplicationController
  
  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # binding.pry

    if @recipe
      @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @recipe = Recipe.find(params[:id])
   # binding.pry
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)
    redirect_to @recipe

  end


  private


  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
  end
end
