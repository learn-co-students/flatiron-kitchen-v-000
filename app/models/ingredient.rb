class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	validates :name, presence: true
	accepts_nested_attributes_for :recipes, reject_if: :all_blank

	# def comments_attributes=(comment_attributes)
 #    comment_attributes.values.each do |comment_attribute|
 #      comment = Category.find_or_create_by(comment_attribute)
 #      self.comments << comment
 #   end


end