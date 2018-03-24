class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: params[:name])
    @recipe.ingredients.build(quantity: params[:quantity])
    @recipeingredient = RecipeIngredient.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipeingredient = RecipeIngredient.create(recipe_params)
    redirect_to recipes_path
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :edit
    end
  end

  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name,
    ingredients_attributes: [
      :id,
      :name,
      :quantity
      ]
    )
  end
end
