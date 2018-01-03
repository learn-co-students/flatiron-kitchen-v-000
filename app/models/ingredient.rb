class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true

  def self.search(search_term)
    if search_term
      self.where('name LIKE ?', "%#{search_term}%")
    else
      self.all
    end
  end

  def quantity
    Ingredient.where("name = ?", "#{self.name}").count
  end
end
