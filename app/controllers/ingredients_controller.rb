class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @ingredient.attributes=(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "edit"
    end
  end

private 
  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
