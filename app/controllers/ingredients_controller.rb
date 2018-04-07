class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredients_path
    else
      redirect_to new_ingredient_path
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to edit_ingredient_path(@ingredient)
    end
  end


  def delete
  end


  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end


end
