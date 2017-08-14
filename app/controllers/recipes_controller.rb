class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.sort_by{|i| i.name}
  end

  def show
    set_recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    set_recipe
  end

  def update
    set_recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :servings, ingredient_ids: [])
  end
end
