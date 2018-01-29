class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true


  # accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
  
  def ingredients_attributes=(ingredients_hashes)
    ingredients_hashes.each do |i, ing_attributes|
      if ing_attributes[:name].present?
        ingredient = Ingredient.find_or_create_by(name: ing_attributes[:name])
        if !self.ingredients.include?(ingredient)
          self.recipe_ingredients.build(:ingredient => ingredient)
        end

      end

    end
  end
end
