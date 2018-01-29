class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new

  end
  
  def create
    @ingredient = Ingredient.create(ingredients_params)
    render "show"
  end
  
  def show
    @ingredient = Ingredient.find(params[:id])

  end
  def edit 
    @ingredient = Ingredient.find(params[:id])
    
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredients_params)
    render "show"
  end


  private
    def ingredients_params
      params.require(:ingredient).permit(:name)
        
    end
end
