class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:edit, :update]

  def index
    @ingredients = Ingredient.all
  end

=begin
  def show
    @ingredient = Ingredient.find(params[:id])
  end
=end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
        redirect_to ingredients_path
      else
        render :new
      end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end



  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
