class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    # binding.pry
    @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        redirect_to ingredient_path(@ingredient)
      else
        @error = "You have encountered an error. Please Try Again"
        render 'ingredients/new.html.erb'
      end
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def edit
  end

  def update
    @ingredient.attributes = ingredient_params
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      @error = "You have encountered an error. Please Try Again"
      render 'ingredients/edit.html.erb'
    end
  end


  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:id])
  end
end
