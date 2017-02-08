class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(name: recipe_params[:name])

    if !recipe_params[:ingredients].first.empty?
      params[:recipe][:ingredients].each do |i|
        if !i.empty?
          @recipe.ingredients << Ingredient.find(i)
        end
      end
    end

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
    @recipe.update(name: recipe_params[:name], ingredient_ids: recipe_params[:ingredients])





    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredients:[])
  end
end
