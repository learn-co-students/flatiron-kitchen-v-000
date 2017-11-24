class RecipeIngredientsController < ApplicationController
  belongs_to :recipe
  belongs_to :ingredient
end
