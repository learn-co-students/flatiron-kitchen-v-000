class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to @recipe
  end

  def show
    @recipe = get_recipe
  end

  def edit
    @recipe = get_recipe
  end

  def update
    @recipe = get_recipe
    @recipe.assign_attributes(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else 
      render :edit
    end
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attributes: [:name])
  end

  def get_recipe
    Recipe.find_by(id: params[:id])
  end

end
