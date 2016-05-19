class Recipe < ActiveRecord::Base
  has_many  :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |attribute|
      if !attribute.blank?
      ingredient = Ingredient.create(name: attribute)
      self.ingredients << ingredient
      end
    end
  end
end
