class RecipesController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  private

  def ingred_params
    params.require(:recipe).permit(:name)
  end
end
