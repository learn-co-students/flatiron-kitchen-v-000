class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  belongs_to :recipe
end
