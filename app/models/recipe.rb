class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredients_attributes=(attributes_hash)
    if attributes_hash["0"][:name] == ""
    else
      ing = Ingredient.find_or_create_by(attributes_hash[:name])
      self.ingredients << ing
      self.save
    end
  end
end
