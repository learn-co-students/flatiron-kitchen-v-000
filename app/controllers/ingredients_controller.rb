class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      redirect_to ingredients_path
    else
      render :new
    end

  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url }
      format.json { head :no_content }
    end
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
