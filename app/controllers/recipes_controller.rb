class RecipesController < ApplicationController

  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    #raise params.inspect
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.assign_attributes(recipe_params)
    if @recipe.valid?
      @recipe.save
      redirect_to @recipe
    else
      render :edit
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
