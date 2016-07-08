class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    redirect_to @ingredient
  end

  def show
    @ingredient = get_ingredient
  end

  def edit
    @ingredient = get_ingredient
  end

   def update
    @ingredient = get_ingredient
    @ingredient.assign_attributes(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else 
      render :edit
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, )
  end

  def get_ingredient
    Ingredient.find_by(id: params[:id])
  end

end
