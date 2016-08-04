class IngredientsController < ApplicationController
  
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

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
    if params[:search]
      @ingredients = Ingredient.search(params[:search]).order("created_at DESC")
    else
      @ingredients = Ingredient.all.order('created_at DESC')
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
