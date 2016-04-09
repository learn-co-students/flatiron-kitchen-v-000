class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    set_ingredient
    if @ingredient.update ingredient_params
      redirect_to ingredients_path
    else
      render 'edit'
    end
  end


  def edit
    set_ingredient
  end

  def show
    set_ingredient
  end

  def index
    @ingredients = Ingredient.all
  end

  def search
    @ingredient = Ingredient.search(params[:name])
    render 'index'
  end

  private
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
  def ingredient_params
    params.require(:ingredient).permit(:name, :recipe_ids)
  end

end
