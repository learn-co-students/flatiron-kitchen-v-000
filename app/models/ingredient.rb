class Ingredient < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :recipes, :through => :recipe_ingredients

  def self.quantity_ingredients
    Ingredient.all.count
  end
end
