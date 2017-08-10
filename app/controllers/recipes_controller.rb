class RecipesController < ApplicationController
    def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
   
  end

  def update
    if recipe.update_attributes(recipe_params)
      redirect_to recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end
  helper_method :recipe
end
