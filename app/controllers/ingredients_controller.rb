class IngredientsController < ApplicationController

  def new
    @ingredient = ingredient.new
  end
end
