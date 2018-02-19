class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
    render 'index'
  end

  def update
   @recipe = Recipe.find(params[:id])

     if @recipe.update_attributes(recipe_params)
        redirect_to :action => 'show', :id => @recipe
     else
        @recipes = Recipe.all
        render :action => 'edit'
     end
   end

  private

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
  end
end
