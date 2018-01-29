class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(post_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    set_ingredient
    @ingredient.assign_attributes(post_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def edit
    set_ingredient
  end

  def show
    set_ingredient
  end

  def index
    @ingredients = Ingredient.all
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def post_params
    params.require(:ingredient).permit(:name, :quantity)
  end
end
