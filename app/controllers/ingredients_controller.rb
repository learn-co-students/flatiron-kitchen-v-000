class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :show]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def index
    @ingredients = Ingredient.all
  end

  def edit
  end

  def update
    @ingredient.name = params[:ingredient][:name]
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def show
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
