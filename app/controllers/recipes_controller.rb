class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  # PATCH/PUT /recipes/1
  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end
