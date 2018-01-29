class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :recipe_ingredients

  def recipe_ingredients_attributes=(attributes)
    self.recipe_ingredients.destroy_all
    attributes.each do |index, attributes|
      self.recipe_ingredients.build(attributes)
    end
  end
end
