class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true

  def ingredient_ids=(ingredient_ids)
    ingredient_ids.compact.each do |ingredient_id|
      self.ingredients << Ingredient.find_by(id: ingredient_id) if !ingredient_id.blank?
    end
  end
end
