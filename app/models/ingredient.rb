class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
<<<<<<< HEAD
=======

>>>>>>> 1f7182da6f3edfa71386dbc2b7870e2f52922318
  validates :name, presence: true
end
