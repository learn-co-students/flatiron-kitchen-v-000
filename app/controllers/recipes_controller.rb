class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #binding.pry
    @recipe = Recipe.new(check_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(check_params)
    redirect_to recipe_path(@recipe)
  end


  private

  def check_params

    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
