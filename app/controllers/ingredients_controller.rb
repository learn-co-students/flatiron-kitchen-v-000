require 'pry'

class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
    @button = 'Create Ingredient'
  end

  def show
  end

  def create
    if params[:ingredient].empty?
      redirect_to '/new'
    else
      @ingredient = Ingredient.new(post_params)
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    end
  end

  def edit
    get_ingredient
    @button = 'Update Ingredient'
  end

  def update
    get_ingredient
    @ingredient.update(post_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  private

  def get_ingredient
    @ingredient = Ingredient.find_by(params[:id])
  end

  def post_params
    params.require(:ingredient).permit(:name)
  end
end
