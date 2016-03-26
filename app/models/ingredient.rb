class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
   accepts_nested_attributes_for :recipes

  validates :name, presence: true


  # def ingredients_attributes=(ingredients)
  #     ingredients.values.each do |ingredient|
  #       binding.pry
  #       unless ingredient[:name] == ""
  #         self.ingredients << Ingredient.find_or_create_by(name: ingredient[:name])
  #       end
  #     end
  #   end
  # validates_uniqueness_of :name
  # validates_presence_of :name
end
