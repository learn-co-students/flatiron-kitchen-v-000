class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  validates :name, presence: true

  def ingredient_ids=(ids)
    ids.each do |id|
      if !id.empty?
        ingredient = Ingredient.find(id)
        self.ingredients << ingredient
      end
    end
  end


end
