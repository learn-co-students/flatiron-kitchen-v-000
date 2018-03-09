class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingr_attribute|
      ingr_attribute = Ingredient.find_or_create_by(ingr_attribute)
      self.ingredients << ingr_attribute
    end
  end
end
