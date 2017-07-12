class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }

  # def ingredients_attributes=(ingredient_attributes)
  #   ingredient_attributes.values.each do |ingredient_attribute|
  #     if ingredient_attributes[:name].present?
  #       ingredient = Ingredient.find_or_create_by(ingredient_attribute)
  #       if !self.ingredients.include?(ingredient)
  #         self.recipe_ingredients.build(ingredient: ingredient)
  #       end
  #     end
  #   end
  # end

end
