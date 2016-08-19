class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(post_params)

    redirect_to recipe_path(@recipe)
  end

  def show
  end

  def edit
  end

  def update
    @recipe.update(post_params)

    redirect_to recipe_path(@recipe)
  end

  private

    def post_params
      params.require(:recipe).permit(:name, ingredient_ids:[])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
