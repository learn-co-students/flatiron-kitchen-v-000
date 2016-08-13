class Ingredient < ActiveRecord::Base
	has_many :recipes, through: :recipe_ingredients
	has_many :recipe_ingredients
	validates_presence_of :name

	def self.available_ingredients
		ingredients = Ingredient.all.select{|ingredient| ingredient.in_stock == true}
	end

	def self.ingredients_to_dishes 
		count = 0
		Recipe.all.each do |recipe|
			if (recipe.ingredients - Ingredient.available_ingredients).empty?
				count += 1
			end
		end
		count
	end
end
