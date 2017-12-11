class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.valid?
      recipe.save
      redirect_to recipe_path(recipe)
    else
      render :new
    end
  end

  def show
    set_recipe
  end

  def edit
    set_recipe
  end

  def update
    set_recipe.update(recipe_params)
    if set_recipe.valid?
      redirect_to recipe_path(set_recipe)
    else
      render :edit
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [])
    end
end