class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true

	# def ingredient_ids=(ids)
	# 	unless ids.empty?
	# 		ids.each do |id|
	# 			self.ingredients << Ingred
	# 		end
	# 	end
	# end
end
