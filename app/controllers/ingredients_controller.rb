class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update((ingredient_params))
      redirect_to @ingredient
    else
      render :edit
    end
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
