class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    @recipe.update(form_params)
    redirect_to @recipe
  end

  def show
    set_recipe
  end

  def create
    @recipe = Recipe.create(form_params)
    redirect_to @recipe
  end

  private

    def set_recipe
      @recipe ||= Recipe.find(params[:id])
    end

    def form_params
      params.require(:recipe).permit(:name, ingredient_ids:[])
    end
end
