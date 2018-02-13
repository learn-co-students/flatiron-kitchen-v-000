class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(post_params)

    @ingredient.save

    redirect_to @ingredient
  end

  def update
    @ingredient.update(post_params)

    redirect_to @ingredient
  end

  private

  def post_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
