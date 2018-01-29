class Recipe < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true
	
	accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }


	def ingredient_attributes=(ingredient)
    	self.ingredient = Ingredient.find_or_create_by(name: ingredient.name)
    	self.ingredient.update(ingredient)
	end

	# def ingredient_ids=(array)
	# 	self.ingredients.clear
	# 	array.each do |ingredient_id|
	# 		self.ingredients << Ingredient.find(ingredient_id) if ingredient_id != ""
	# 	end
	# 	# self.ingredients << Ingredient.all.last
	# 	self.save
	# end
end
