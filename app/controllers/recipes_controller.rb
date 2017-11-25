class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def index

  end

  def new
    @recipe = Recipe.new
  end

  def create
    binding.pry
    # @recipe = Recipe.new(recipe_params)
  end

  private

  def recipe_params
    params.require(:recipe).permit()
  end

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end
end

# touch app/views/recipes/new.html.erb
# touch app/views/recipes/show.html.erb
# touch app/views/recipes/edit.html.erb
# touch app/views/recipes/_form.html.erb
