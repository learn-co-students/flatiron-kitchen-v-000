<<<<<<< HEAD
class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :edit
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids:[])
=======
class IngredientsController < ApplicationController
  def index
		@ingredients = Ingredient.all
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def edit
	  @ingredient = Ingredient.find(params[:id])
	end

	def new
		@ingredient = Ingredient.new
	end

	def create
    @ingredient = Ingredient.new(recipe_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end


  def recipe_params
    params.require(:recipe).permit(:name, :quantity)
>>>>>>> 1f7182da6f3edfa71386dbc2b7870e2f52922318
  end
end
