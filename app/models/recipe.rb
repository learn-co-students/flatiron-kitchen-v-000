class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  #accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes[:name].blank? }  

  def ingredients_attributes=(ingredients_attributes) 
    ingredients_attributes.values.each do |attributes|
      self.ingredients << Ingredient.find_or_create_by(attributes) unless self.ingredients.find_by(attributes)
    end
  end
end
