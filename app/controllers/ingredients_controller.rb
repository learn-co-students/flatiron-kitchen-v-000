class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all 
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(get_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to :new
    end
  end

  def show
    get_ingredient
  end

  def edit
    get_ingredient
  end

  def update
    get_ingredient
    if @ingredient.update(get_params)
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to :edit
    end
  end

  private
    def get_params
      params.require(:ingredient).permit(:name)
    end

    def get_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

end
