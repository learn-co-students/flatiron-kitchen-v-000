class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
  @ingredient = Ingredient.new(recipe_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to recipe_path(@ingredient)
  end
private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
