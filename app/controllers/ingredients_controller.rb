class IngredientsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def show
  end

  def edit
  end

  def create
    Ingredient.create(i_params)
    redirect_to ingredients_path
  end

  def update
    if @ingredient.update(i_params)
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private
  def i_params
    params.require(:ingredient).permit(:name)
  end

  def set_article
    @ingredient = Ingredient.find(params[:id])
  end
end
