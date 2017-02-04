class IngredientsController < ApplicationController
  
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ing_params)
    #binding.pry

    if @ingredient
      @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    
    @ingredient.update(ing_params)

    #binding.pry
    redirect_to @ingredient
  end

  def destroy
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  #  binding.pry
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end


  private

    def ing_params
      params.require(:ingredient).permit(:name, recipe_ids: [])
    end


end


