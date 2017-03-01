class Recipe < ActiveRecord::Base
  has_many :ingredients

  validates :name, presence: true

  def ingredients_attributes=(attrs)
    attrs.values.each do |attr|
      if attr[:name].present?
        ingr = Ingredient.find_or_create_by(attr)
        self.ingredients.concat(ingr) if !self.ingredients.include?(ingr)
      end
    end
  end
end
