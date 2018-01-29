class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    redirect_to ingredient_path(@ingredient)
  end

    private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end


=begin

why all the hoop la? You can make another abstraction with Obj.name?
(ingredient)or something like I used on that abstraction for 
find(params[:id]). => talk to avi. but first look up the abstraction from before.

basic_CRUD(ingredient) =>   

def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)

    redirect_to ingredient_path(@ingredient)
  end

    private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end



=end