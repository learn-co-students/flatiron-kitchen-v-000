class RecipeIngredient < ActiveRecord::Base
	belongs_to :recipe
	belongs_to :ingredient
end
# have a join table with attributes associated with it. 
