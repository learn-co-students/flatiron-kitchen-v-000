class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path # redirect to index page displaying all ingredients
    else
      render :new
    end
  end

  def show
  end

  def index
    @ingredients = Ingredient.all
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to ingredients_path
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :total_inventory)
    end
end
