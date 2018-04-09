class RecipesController < ApplicationController

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.find(params[:id])
  end

  # GET /recipes/new
  def new
    @ingredients = Ingredient.all
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @ingredients = Ingredient.all
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end


  # PATCH/PUT /recipes/1

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :edit
    end
  end


  private


  def get_ingredients
    @ingredients = Ingredient.all
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
