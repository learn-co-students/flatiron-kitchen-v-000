class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def new
    @recipe = Recipe.new
  
  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end  

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def edit
    @ingredient = @recipe.ingredients.build
  end


    private
    def recipe_params
      params.require(:recipe).permit(:name, ingredient_ids:[], ingredients_attributes: [:name])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end


end
