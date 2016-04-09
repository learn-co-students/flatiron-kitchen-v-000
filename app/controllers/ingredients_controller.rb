class IngredientsController < ApplicationController
  before_action :find_ingredient, :only => [:edit]

  def index
    @ingredients = Ingredient.all
  end
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)

    redirect_to ingredients_path
  end

  def edit
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    redirect_to ingredients_path
  end

  private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
