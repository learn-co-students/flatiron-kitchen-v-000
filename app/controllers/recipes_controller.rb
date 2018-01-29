class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
     @recipe = Recipe.find(params[:id])
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

 def update
   @recipe = Recipe.find(params[:id])
   @recipe.update(recipe_params)
   redirect_to recipe_path(@recipe)
 end

 def recipe_params
   params.require(:recipe).permit(:name, ingredient_ids: [])
 end

end
