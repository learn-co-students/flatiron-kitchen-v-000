class RecipesController < ApplicationController
  def index

  end

  def ingredient_ids=(ingredient_ids)

  end

  private

    def recipe_params
      params.require()
    end
end
