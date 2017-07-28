class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates_presence_of :name

	# accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }

	# def ingredients_attributes=(ingredients_attributes)
	# 	ingredients_attributes.each do |i, ingredient_attributes|
	# 		self.ingredients.build(ingredient_attributes)
	# 	end
	# end

end
