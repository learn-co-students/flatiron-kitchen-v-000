class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    set_recipe
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredients_attributes => [:name])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
