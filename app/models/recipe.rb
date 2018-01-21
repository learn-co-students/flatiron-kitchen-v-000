class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  # def calculate
  #   i = 0
  #   self.ingredients.collect do |ingredient|
  #     if ingredient.quantity < i
  #       i = ingredient.quantity
  #     end
  #     i
  #   end
  #   i
  #   #self.ingredients.quantities.compact.min
  # end

end
