class ReceipeIngredientsController < ApplicationController
  before_action :set_receipe_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /receipe_ingredients
  # GET /receipe_ingredients.json
  def index
    @receipe_ingredients = ReceipeIngredient.all
  end

  # GET /receipe_ingredients/1
  # GET /receipe_ingredients/1.json
  def show
  end

  # GET /receipe_ingredients/new
  def new
    @receipe_ingredient = ReceipeIngredient.new
  end

  # GET /receipe_ingredients/1/edit
  def edit
  end

  # POST /receipe_ingredients
  # POST /receipe_ingredients.json
  def create
    @receipe_ingredient = ReceipeIngredient.new(receipe_ingredient_params)

    respond_to do |format|
      if @receipe_ingredient.save
        format.html { redirect_to @receipe_ingredient, notice: 'Receipe ingredient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @receipe_ingredient }
      else
        format.html { render action: 'new' }
        format.json { render json: @receipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipe_ingredients/1
  # PATCH/PUT /receipe_ingredients/1.json
  def update
    respond_to do |format|
      if @receipe_ingredient.update(receipe_ingredient_params)
        format.html { redirect_to @receipe_ingredient, notice: 'Receipe ingredient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipe_ingredients/1
  # DELETE /receipe_ingredients/1.json
  def destroy
    @receipe_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to receipe_ingredients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipe_ingredient
      @receipe_ingredient = ReceipeIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipe_ingredient_params
      params.require(:receipe_ingredient).permit(:recipe_id, :ingredient_id)
    end
end
