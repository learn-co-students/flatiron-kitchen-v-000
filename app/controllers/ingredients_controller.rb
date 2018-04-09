class IngredientsController < ApplicationController

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
        redirect_to ingredients_path
    else
        render :new
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
        redirect_to ingredients_path
    else
      render :edit
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
