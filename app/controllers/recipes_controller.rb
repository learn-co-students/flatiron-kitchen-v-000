class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show, :edit, :update]

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times{@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end 
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
