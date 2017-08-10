class IngredientsController < ApplicationController
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

  def show
  end

  def edit
  end

  def update
    if ingredient.update_attributes(ingredient_params)
      redirect_to ingredient
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def ingredient
    @ingredient ||= Ingredient.find(params[:id])
  end
  helper_method :ingredient

 end
