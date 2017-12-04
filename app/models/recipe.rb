require 'pry'
class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  #before_validation :name_capitalized
  validates :name, presence: true
  #validate :is_name_capitalized
  accepts_nested_attributes_for :ingredients

  #def is_name_capitalized
    #if name.split.any? {|w| w[0].upcase != w[0]}
    #  errors.add(:name, "Name must be capitalized")
    #end
  #end

  #def name_capitalized
  #  name.capitalize
  #end

  def ingredients_attributes=(ingredient_attributes)
    if ingredient_attributes.any? {|i, v| v[:name].present?}
      ingredient_attributes.each do |i,v|
        ingredient = Ingredient.find_or_create_by(name: v[:name])
        self.ingredients << ingredient
      end
    end
  end

end
