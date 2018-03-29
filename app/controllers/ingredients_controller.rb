class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]
  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end
  def create
    @ingredient = Ingredient.find_or_initialize_by(name: params[:ingredient][:name])
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render "new"
    end
  end
  def show
  end
  def edit
  end
  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
