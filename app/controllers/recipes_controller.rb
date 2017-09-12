class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

  end

  def new
    # binding.pry
    @recipe = Recipe.new
    @ingredient = Ingredient.new
    
  end
  def create
    raise params.inspect

    @recipe = Recipe.create(recipe_params)
      if @user.save
         redirect_to @recipe
      else
        render "new"
      end
  end
  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])

  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
  end


  private

    # def recipe_params
    #   params.require(:recipe).permit(:name)
    # end
end
