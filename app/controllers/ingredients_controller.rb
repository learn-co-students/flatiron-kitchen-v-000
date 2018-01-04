class IngredientsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingred_params)
  end

  def update
  end

  private

  def ingred_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingred
    @ingredient = ingredient.find(params[:id])
  end
end
