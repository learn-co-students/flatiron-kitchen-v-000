class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.persisted?
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    recipe_by_id
  end

  def edit
    recipe_by_id
  end

  def update
    recipe_by_id.name
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'edit'
    end
  end


  def recipe_by_id
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_attributes: [:name], ingredient_ids: [])
  end
end
