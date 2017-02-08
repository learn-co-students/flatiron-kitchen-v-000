class Recipe < ActiveRecord::Base
  validates :name, presence: :true
  validates :name, uniqueness: :true

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

end
