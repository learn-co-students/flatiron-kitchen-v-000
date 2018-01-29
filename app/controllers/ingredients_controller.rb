class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.sort_by{|i| i.name}
  end

  def show
    set_ingredient
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.valid?
      @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render :edit
    end
  end

private

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :stock)
  end
end
