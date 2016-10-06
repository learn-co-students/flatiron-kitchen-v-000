class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    find
  end

  def edit
    find
  end

  def update
    find
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

private

def find
  @recipe = Recipe.find_by_id(params[:id])
end

def recipe_params
  params.require(:recipe).permit(:name, ingredient_ids:[])
end

end
