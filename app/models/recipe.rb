# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  course_name :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  validates :name, presence: true
end
