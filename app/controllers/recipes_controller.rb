class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(id: params[:id])
  end
end
