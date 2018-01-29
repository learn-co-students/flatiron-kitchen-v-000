class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(post_params)

    redirect_to ingredient_path(@ingredient)
  end

  def show
  end

  def edit
  end

  def update
    @ingredient.update(post_params)

    redirect_to ingredient_path(@ingredient)
  end

  private

    def post_params
      params.require(:ingredient).permit(:name)
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
