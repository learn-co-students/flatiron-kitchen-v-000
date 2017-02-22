class Recipe < ActiveRecord::Base
  validates :name, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  def self.quantity_cookable(recipe)
    cookable = 0
    Recipe.all.each do |r|
      if (r.ingredients - recipe.ingredients.all).empty?
        cookable += 1
      end
    end # close Recipe loop
    cookable
  end # close method

end # close class
