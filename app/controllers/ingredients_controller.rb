class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    #raise params.inspect
    @ingredient = Ingredient.new(ingredient_params)
    if Ingredient.all.find_by(name:ingredient_params[:name]).blank?
      @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else
      redirect_to ingredients_path
    end
  end

  def show
    @ingredient = find_by_params_id
  end

  def edit
    @ingredient = find_by_params_id
  end

  def update
    @ingredient = find_by_params_id
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      render :edit
    end
  end

  private
  def find_by_params_id
    Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
