# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true
end
