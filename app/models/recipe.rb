class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :name, presence: true
  #accepts_nested_attributes_for :ingredients

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, ingredient_attributes|
      self.ingredients.build(ingredient_attributes)
    end
  end
end

# ingredients_attributes is a hash whose keys are "0", "1", etc (indexed keys), and
# each indexed key points to a hash containing 1 key/value pair of name attribute data
# for a single new ingredient instance
# For example:

# ingredients_attributes = {
#   "0" => {:name => "name attribute value of ingredient instance is entered in form"},
#   "1" => {:name => "another name attribute value of another ingredient instance"}
# }
