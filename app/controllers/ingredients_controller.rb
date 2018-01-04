class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = set_ingred
  end

  def show
    @ingredient = set_ingred
  end

  def create
    @ingredient = Ingredient.new(ingred_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :new
    end
  end

  def update
    @ingredient = set_ingred
    @ingredient.update(ingred_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private

  def ingred_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingred
    @ingredient = Ingredient.find(params[:id])
  end
end
