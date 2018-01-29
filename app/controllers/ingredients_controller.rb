class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:show, :edit, :update]

  def index
    @ingrs = Ingredient.all
  end

  def new
    @ingr = Ingredient.new
  end

  def create
    @ingr = Ingredient.new(ingredient_params)
    if @ingr.save
      redirect_to @ingr
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ingr.update(ingredient_params)
      redirect_to @ingr
    else
      render "edit"
    end
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def set_ingredient
      @ingr = Ingredient.find(params[:id])
    end
end
