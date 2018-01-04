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
    @ingredient = Ingredient.new(ingred_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
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
