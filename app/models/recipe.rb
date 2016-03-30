class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  # has_many :ingredient_quantities, through: :recipe_ingredients, source: :ingredient_quantity

  validates :name, presence: true 

  accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(attrs)
    attrs.delete_if{|att| att["name"].blank?}
    attrs.values.each{|attr| 
      self.ingredients << Ingredient.find_or_create_by(attr)
      self.save
    }
  end
end
