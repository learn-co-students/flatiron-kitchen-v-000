class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true

 accepts_nested_attributes_for :ingredients, reject_if: lambda {|attributes| attributes['name'].blank?}
  # def ingredients_attributes=(ingredients)
  #   ingredients.values.each do |ingredient|
  #     unless ingredient[:name] == ""
  #       self.ingredients << Ingredient.find_or_create_by(name: ingredient[:name])
  #     end
  #   end
  # end

#   def ingredient_ids=(ingredient_ids)
#   ingredients = Ingredient.where("id in (?)", ingredient_ids)
#   self.ingredients = ingredients
# end

end
