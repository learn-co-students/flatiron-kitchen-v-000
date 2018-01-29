class IngredientsController < ApplicationController
  before_action :set_ingred, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingred_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @ingredient.update(ingred_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private

  def set_ingred
    @ingredient = Ingredient.find(params[:id])
  end

  def ingred_params
    params.require(:ingredient).permit(:name)
  end
end
