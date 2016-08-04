class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :name

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
