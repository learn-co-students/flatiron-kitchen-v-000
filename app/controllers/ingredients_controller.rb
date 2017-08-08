class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end

  def edit
    set_ingredient
  end

  def update
    set_ingredient
    @ingredient.update(form_params)
    redirect_to @ingredient
  end

  def show
    set_ingredient
  end

  def create
    @ingredient = Ingredient.create(form_params)
    redirect_to @ingredient
  end

  private

    def set_ingredient
      @ingredient ||= Ingredient.find(params[:id])
    end

    def form_params
      params.require(:ingredient).permit(:name)
    end

end
