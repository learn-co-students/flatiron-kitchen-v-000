class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	validates_presence_of :name
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank

	def ingredients_attributes(attributes)
		attributes.each do |attri|
			ingredient = Ingredient.find_or_create_by(attri)
			self.ingredients << ingredient
		end
	end
end
