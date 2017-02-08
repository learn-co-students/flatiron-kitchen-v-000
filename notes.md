Remember to use --no-test-framework

ingredients
  string name

  validates :name, presence: :true
  has_many recipes
  belongs_to recipe_ingredients


recipe
  string name

  validates :name, presence: :true
  has_many ingredients
  belongs_to recipe_ingredients



join table for recipe_ingredients
