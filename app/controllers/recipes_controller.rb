class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # raise params.inspect
    @recipe = Recipe.new(get_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      redirect_to :new
    end
  end

  def show
    get_recipe
  end

  def edit
    get_recipe
  end

  def update
    get_recipe
    if @recipe.update(get_params)
      redirect_to recipe_path(@recipe)
    else
      redirect_to :edit
    end
  end

  private
    def get_params
      params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def get_recipe
      @recipe = Recipe.find(params[:id])
    end

end
