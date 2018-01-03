class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients, reject_if: :ingredient_without_name

  def ingredient_without_name(attributes)
    attributes[:name].blank?
  end

  def self.search(search_term)
    if search_term
      self.where('name LIKE ?', "%#{search_term}%")
    else
      self.all
    end
  end

  def num_of_dishes
    num = self.ingredients.collect do |ingredient|
      ingredient.quantity
    end
    num.min
  end
end
