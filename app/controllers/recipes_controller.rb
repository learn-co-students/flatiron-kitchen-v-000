class RecipesController < ApplicationController
 
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create 
    @recipe = Recipe.create(recipe_params)
    # @recipe.save
    # @new_ingredient = Ingredient.find_or_create_by(name: params[:ingredient][:name])
    # @recipe.ingredients << @new_ingredient
    if @recipe.save
      redirect_to @recipe
    end
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

  def destroy
    @recipe.destroy
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids =>[], :ingredient => [:name])
  end

end
