class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    load_instance
  end

  def new
    @recipe = Recipe.new
  end

  def edit
    load_instance
  end

  def create
    @recipe = Recipe.new(post_params)
    @recipe.save ? redirect_to(recipe_path(@recipe)) : render(:new)
  end

  def update
    load_instance
    @recipe.update(post_params)
    @recipe.save ? redirect_to(recipe_path(@recipe)) : render(:edit)
  end

  private
  def load_instance
    @recipe = Recipe.find_by(id: params[:id])
  end
  def post_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
