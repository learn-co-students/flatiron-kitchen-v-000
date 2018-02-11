class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

  def ingredient_ids=(ids)
    self.ingredients.clear
    ids.each do |id|
      if id.present?
        ingredient = Ingredient.find_or_create_by(id)
        self.ingredients << ingredient
      end
    end
  end
end
