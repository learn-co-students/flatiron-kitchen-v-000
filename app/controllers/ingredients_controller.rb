class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit]

  def new
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(ingredient_params)
    redirect_to ingredient
  end

  def show
  end

  def edit
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update(ingredient_params)
    redirect_to ingredient
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

end
