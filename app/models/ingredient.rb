class Ingredient < ActiveRecord::Base
  has_many :recipe_ingretients
  has_many :recipes, through: :recipe_ingretients

  validates :name, presence: true
end
