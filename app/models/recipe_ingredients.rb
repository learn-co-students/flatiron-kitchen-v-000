class RecipeIngredients < ActiveRecord::Base
  validates :name, presence: :true
  validates :name, uniqueness: :true

  belongs_to :recipe
  belongs_to :ingredient
end
