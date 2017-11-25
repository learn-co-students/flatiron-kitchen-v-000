class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # binding.pry
      redirect_to recipe_path(@recipe)
    else
      render 'recipe/new.html.erb'
    end
  end

  def update
    @recipe.attributes = recipe_params
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/edit.html.erb"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end
end

# touch app/views/recipes/new.html.erb
# touch app/views/recipes/show.html.erb
# touch app/views/recipes/edit.html.erb
# touch app/views/recipes/_recipe.html.erb
