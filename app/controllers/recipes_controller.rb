class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    set_recipe
    if @recipe.update recipe_params
      redirect_to recipes_path
    else
      render 'edit'
    end
  end


  def edit
    set_recipe
  end

  def show
    set_recipe
  end

  def index
    @recipes = Recipe.all
  end

  def search
    @recipe = Recipe.search(params[:name])
    render 'index'
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end
