class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    if @ingredient.persisted?
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def show
    ingredient_by_id
  end

  def edit
    ingredient_by_id
  end

  def update
    ingredient_by_id.name
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'edit'
    end
  end


  def ingredient_by_id
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
