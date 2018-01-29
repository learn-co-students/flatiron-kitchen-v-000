class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients

  validates_presence_of :name

  def ingredients=(ingredients)
    self.ingredients.build(ingredients)
  end
end
