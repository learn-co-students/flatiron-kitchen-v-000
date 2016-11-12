class IngredientsController < ApplicationController

 
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.find_or_create_by(name: params[:ingredient][:name])
    
    redirect_to @ingredient
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update 
    @ingredient = Ingredient.find(params[:id])

    @ingredient.update(ingredient_params)
    redirect_to @ingredient 
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end
  

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end


end



# // ♥ rake routes
#          Prefix Verb URI Pattern                     Controller#Action
#         recipes GET  /recipes(.:format)              recipes#index
#      new_recipe GET  /recipes/new(.:format)          recipes#new
#     edit_recipe GET  /recipes/:id/edit(.:format)     recipes#edit
#          recipe GET  /recipes/:id(.:format)          recipes#show
#     ingredients GET  /ingredients(.:format)          ingredients#index
#  new_ingredient GET  /ingredients/new(.:format)      ingredients#new
# edit_ingredient GET  /ingredients/:id/edit(.:format) ingredients#edit
#      ingredient GET  /ingredients/:id(.:format)      ingredients#show