class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ingredient_params
      params.require(:ingredient).permit(:name)
  end

end
