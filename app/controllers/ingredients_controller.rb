class IngredientsController < ApplicationController

  def index
  end

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

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # def update
  #   @ingredient = Ingredient.find(params[:id])
  #   if @ingredient.update
  #     redirect_to @ingredient
  #     # Handle a successful update.
  #   else
  #     render 'edit'
  #   end
  # end 

  def update
  @ingredient = Ingredient.find(params[:id])
  @ingredient.update(ingredient_params)
  redirect_to @ingredient
end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end