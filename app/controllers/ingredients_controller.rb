class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render action: 'show'
    else
      render action: 'new'
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    
    if @ingredient.update(ingredient_params)
      render action: 'show'
    else
      render action: 'edit'
    end
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
