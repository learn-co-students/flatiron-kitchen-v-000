class RecipesController < ApplicationController
  layout "application"
  before_action :set_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save

        redirect_to recipe_path(@recipe)
      else

        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
      else

        render :edit
      end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :ingredient_ids => [], :ingredient_attributes => [:name])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

end
