class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    set_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    set_ingredient.destroy
    redirect_to 'index'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
