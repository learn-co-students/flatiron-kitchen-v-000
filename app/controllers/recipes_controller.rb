class RecipesController < ApplicationController
  def new
        @recipe = Recipe.new
  end
  def create
        @recipe = Recipe.new(recipe_params)
  #binding.pry
        if @recipe.save
  #binding.pry
                redirect_to recipe_path(@recipe)
        else
                render :new
        end
  def show
  #binding.pry
    @recipe = Recipe.find_by(id: params[:id])
  #binding.pry
  end
  def edit
      #partials and locals used in views
      #binding.pry
      @recipe = Recipe.find_by(id: params[:id])
  end
  def update
  #binding.pry
      @recipe = Recipe.find_by(id: params[:id])
      #test if valid
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
  end
  end

  private
  def recipe_params
  #binding.pry
        params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
  end
