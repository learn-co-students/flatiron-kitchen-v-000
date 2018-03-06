class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]


  def index 
  	@ingredients = Ingredient.all
    # @ingredients = Ingredient.search(params[:search])
  end 

  def new
  	@ingredient = Ingredient.new
    @recipe_ingredients = RecipeIngredient.new
  	# @ingredient.recipes.build
  end 

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredient_path(@ingredient)
    else 
       render :new
    end 
  end 

  def show
   
  end 

  def edit 
   
  end 

  def update
   
  	@ingredient.update(ingredient_params)
  	
    if @ingredient.save
  	   redirect_to ingredients_path
    else
       render :edit
    end 
  end 

  def destroy

  end 

  private

  def ingredient_params
  	params.require(:ingredient).permit(:name, :amount)
  end

  def set_ingredient
     @ingredient = Ingredient.find(params[:id])
  end 


end
