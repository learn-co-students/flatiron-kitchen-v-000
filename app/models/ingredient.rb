class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true

  # def ingredient_count(amount)
  #   new_quantity = self.quantity - amount
  # end

end
