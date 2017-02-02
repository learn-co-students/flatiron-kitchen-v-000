class IngredientsController < ApplicationController
  
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    #@ingredients = Ingredient.all 


    if @ingredient
      @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end


  def destroy
  end

  def show
  end


  private

    def ing_params
      params.require(:ingredient).permit(:name)
    end









end


