class RecipesController < ApplicationController
    #added functionality after reviewing solution
    before_action :set_recipe, only: [:edit, :update]
    #you could also set a  get_ingredients provate method to allow an instance variable @ingredients to be set to the new and edit methods, this would allow those view files to have all ingredients available
  def index
    @recipes = Recipe.all
  end
  def new
        @recipe = Recipe.new
  end
  def create
        @recipe = Recipe.new(recipe_params)
  #binding.pry
        if @recipe.save
  #binding.pry
                redirect_to recipe_path(@recipe)
        else
                render :new
        end
  def show
  #binding.pry
    @recipe = Recipe.find_by(id: params[:id])
  #binding.pry
  end
  def edit
      #added functionality after reviewing solution able to comment out
      #@recipe = Recipe.find_by(id: params[:id])
  end
  def update
    #added functionality after reviewing solution able to comment out with set_recipe
      #@recipe = Recipe.find_by(id: params[:id])
      #test if valid
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
  end
  end

  private
    #added functionality after reviewing solution
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

  def recipe_params
  #binding.pry
        params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
  end
