class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :show, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      redirect_to new_ingredient_path(@ingredient)
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      redirect_to new_ingredient_path(@ingredient)
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
