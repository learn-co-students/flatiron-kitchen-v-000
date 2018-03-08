class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe.id)
    else
      render 'new'
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
    redirect_to recipe_path(@recipe.id)
end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
  end

end
