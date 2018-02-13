class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: :true

  def new_recipe_path
  end

  def self.search(ingredient_name)
    if ingredient_name.present?
      Recipe.where('name LIKE ?', "%#{ingredient_name}%")
    else
      self.all
    end
  end

  #Recipe.where("ingredient_id = ?", @ingredient.id)
end
