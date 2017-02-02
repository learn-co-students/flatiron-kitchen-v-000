class RecipesController < ApplicationController
  
  def index
  end

  
  def create
    @recipe = Recipe.new()

    if @recipe
      @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
  end
end
