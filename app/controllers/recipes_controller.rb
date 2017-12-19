class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # instantiate new recipe instance with its name attribute value mass assigned from strong params
    if @recipe.save # instance is saved to DB if validations pass (i.e. name attribute is NOT blank)
      redirect_to @recipe # redirect to show page to display the recipe just created (same as saying redirect_to recipe_path(@recipe) or redirect_to "/recipes/#{@recipe.id}")
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  private

    def recipe_params # calling this private method returns sanitized, strong params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end
end

# params must have top-level "recipe" key, which points to (and stores) recipe hash
# Within the recipe hash, which is nested inside of the params hash, we permit the "name" key
# This "name" key points to whatever value the user submitted in the Recipe Name form field,
# which will become the @name attribute value of the recipe instance being created
