class IngredientsController < ApplicationController

  def show
    @ingredient = ingredient.find(params[:id])
  end

  def index
    @ingredients = ingredient.all
  end

  def new
    @ingredient = ingredient.new

  end

  def create
    ingredient = ingredient.create(ingredient_params)
    redirect_to ingredients_path
  end
  
  def edit
    @ingredient = ingredient.find(params[:id])
  end

  def update
    @ingredient = ingredient.find(params[:id])

    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to @ingredient
    else
      render :edit
    end
  end
end
