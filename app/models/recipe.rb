class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(attr)
    attr.values.each do |a|
      a = Ingredient.find_or_create_by(a)
      self.ingredients << a
    end
  end
end
