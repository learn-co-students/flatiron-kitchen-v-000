class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: :true
  accepts_nested_attributes_for :ingredients

  def ingredient_ids=(ids)
    ids.delete("")
    self.ingredients.clear
    ids.each do |id|
      self.ingredients << Ingredient.find(id)
    end
  end

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      if ingredient_attributes[:name].present?
        self.ingredients << Ingredient.find_or_create_by(ingredient_attributes)
      end
    end
  end


end
