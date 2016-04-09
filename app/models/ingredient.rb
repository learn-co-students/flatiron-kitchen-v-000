class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true

  def self.search(nickname)
    # match the nickname
    if nickname == ''
      Ingredient.all
    else
      Ingredient.all.select do |s|
        s.name =~ /#{nickname}/i
      end
    end
  end
end
