class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
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
    # if @ingredient.save
      redirect_to ingredient_path(@ingredient.id)
      # redirect_to @ingredient
    # else
    #   render :edit
    # end
  end


  def show
    @ingredient = Ingredient.find(params[:id])
  end


  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_url
  end

private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :id, :recipe_ids)
  end

end
