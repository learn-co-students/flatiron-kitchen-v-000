class RecipesController < ApplicationController
  
  def new
    @submit = "Create Recipe"
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(post_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @submit = "Update Recipe"
    get_recipe
  end

  def update
    get_recipe
    @recipe.update(post_params)
    @recipe.save
    redirect_to @recipe
  end

  def show
    get_recipe
  end

  private

  def post_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end
end
