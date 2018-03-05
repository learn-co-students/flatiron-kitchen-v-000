class IngredientsController < ApplicationController
  def new
        @ingredient = Ingredient.new

  end
  def create
        @ingredient = Ingredient.new(ingredient_params)
#binding.pry
        if @ingredient.save
#binding.pry
                redirect_to ingredient_path(@ingredient)
        else
                render :new
        end
  def show
#binding.pry
    @ingredient = Ingredient.find_by(params[:id])
#binding.pry
  end
  def edit
      #partials and locals used in views
      #binding.pry
      @ingredient = Ingredient.find_by(params[:id])
  end
  def update
#binding.pry
      @ingredient = Ingredient.find_by(id: params[:id])
      #test if valid
        if @ingredient.update(ingredient_params)
            redirect_to ingredient_path(@ingredient)
        else
            render :edit
        end
  end
  end

  private
  def ingredient_params
  #binding.pry
        params.require(:ingredient).permit(:name)
  end
end
