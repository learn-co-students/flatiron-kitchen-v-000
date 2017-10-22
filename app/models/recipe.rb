class Recipe < ActiveRecord::Base
  has_many :recipe_ingretients
  has_many :ingretients, through: :recipe_ingretients

  validates :name, presence: true
end
