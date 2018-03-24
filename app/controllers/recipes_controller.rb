class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
    @recipeingredients = RecipeIngredient.all
  end

  def new
    @recipe = Recipe.new
   
  end

   def create
    recipe = Recipe.new(recipe_params)

    if recipe.save
      redirect_to recipes_path
    else
      render :new
    end
   end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipes path
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
