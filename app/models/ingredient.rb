class Ingredient < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :recipe
end
