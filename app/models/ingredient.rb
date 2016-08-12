class Ingredient < ActiveRecord::Base
	has_many :recipes, through: :recipe_ingredients
	has_many :recipe_ingredients
	validates_presence_of :name

	def ingredient_to_dishes 
		count = 0
		Recipe.all.each do |recipe|
			if (recipe.ingredients - Ingredient.all).empty?
				count += 1
			end
		end
	end
end
