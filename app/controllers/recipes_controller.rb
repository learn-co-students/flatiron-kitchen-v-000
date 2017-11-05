class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end
  def create
    #binding.pry
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to recipe_path(@recipe)
  end
  def index
    @recipes = Recipe.all
  end
  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update!(recipe_params)
    redirect_to @recipe
  end
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |ingredients_attribute|
      ingredient = Ingredient.find_or_create_by(category_attribute)
      self.ingredients << ingredient
    end
  end
  #https://learn.co/tracks/full-stack-web-development-v3/rails/associations-and-rails/has-many-through-in-forms-lab?batch_id=306&track_id=28005
  private
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes:[:name])
  end
  #https://learn.co/tracks/full-stack-web-development-v3/rails/associations-and-rails/has-many-through-in-forms
end
