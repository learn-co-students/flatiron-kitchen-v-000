class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'new'
    end
  end

  def update
    @ingredient = Ingredient.find_by(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
