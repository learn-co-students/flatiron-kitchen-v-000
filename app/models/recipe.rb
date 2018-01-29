class Recipe < ActiveRecord::Base
	has_many :ingredients, through: :recipe_ingredients
	has_many :recipe_ingredients
	# accepts_nested_attributes_for :ingredients
	validates_presence_of :name

	def ingredients_attributes=(ingredients_attributes)
		#ingredients_attributes is an array of hashes!
		ingredients_attributes.each do |ingredient_attribute|
			self.ingredients << Ingredient.find_or_create_by(name: ingredient_attribute["name"])
		end
	end

	def ingredients_attributes
		self.ingredients
	end

	# def ingredient_ids=(ids)
	# 	ids.each do |id|
	# 		self.recipe_ingredients.build(ingredient_id: id)
	# 	end
	# end

	# def ing_names=(names)
	# 	names.each do |name|
	# 		ingredient = Ingredient.find_or_create_by(name: name)
	# 		# ingredient.recipes << self
	# 		binding.pry
	# 		self.ingredients << ingredient unless self.ingredients.include?(ingredient)
	# 	end
	# end

	# def no_name(attributes)
	# 	attributes[:name].blank?
	# end
end
