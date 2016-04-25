class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  def show
    @ingredient = set_ingredient
  end

  def edit
    @ingredient = set_ingredient
  end

  def update
    @ingredient = set_ingredient
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_ids)
  end

  def set_ingredient
    Ingredient.find(params[:id])
  end

end
