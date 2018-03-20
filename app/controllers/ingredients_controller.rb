class IngredientsController < ApplicationController
before_action :set_ingredient, only: [:show, :edit, :destory, :update]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
