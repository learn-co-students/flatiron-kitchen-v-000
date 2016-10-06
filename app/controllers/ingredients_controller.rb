class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      redirect_to ingredients_path
    else
      render 'new'
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
    redirect_to ingredients_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end
end
