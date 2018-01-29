class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    10.times do |i|
      n = 1
      @recipe.ingredients.build(id: n)
      n+=1
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
  def show
    @recipe = Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end
end