class IngredientsController < ApplicationController
  #added functionality after reviewing solution
  before_action :set_ingredient, only: [:edit, :update]

  def index
      @ingredients = Ingredient.all
  end
  def new
        @ingredient = Ingredient.new
  end
  def create
        @ingredient = Ingredient.new(ingredient_params)
#binding.pry
        if @ingredient.save
#binding.pry
                redirect_to ingredient_path(@ingredient)
        else
                render :new
        end
  def show
#binding.pry
    @ingredient = Ingredient.find_by(id: params[:id])
#binding.pry
  end
  def edit
      #pivate set_ingredient method below comments out below method
      #@ingredient = Ingredient.find_by(id: params[:id])
  end
  def update
#binding.pry
      #pivate set_ingredient method below comments out below method
      #@ingredient = Ingredient.find_by(id: params[:id])
      #test if valid
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
  end
  end

  private
  #added functionality after reviewing solution
  def set_ingredient
      @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
  #binding.pry
        params.require(:ingredient).permit(:name)
  end
end
