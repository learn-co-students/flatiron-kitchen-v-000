class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params(:name))

    if @ingredient.save
      redirect_to @ingredient
    else
      redirect_to '/new'
    end
    
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params(:name))
    redirect_to ingredient_path(@ingredient)
  end

  private

  def ingredient_params(*args)
    params.require(:ingredient).permit(*args)
  end

end
