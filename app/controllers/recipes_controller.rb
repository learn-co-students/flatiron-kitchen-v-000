class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
  @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'recipe was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
  @recipe = Recipe.find(params[:id])
  @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'recipe was successfully updated.'
    else
      render action: 'edit'
    end
  end


  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [], ingredients_attrubites: [:name])
  end
end
