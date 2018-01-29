# == Schema Information
#
# Table name: classroom_students
#
#  id           :integer          not null, primary key
#  classroom_id :integer
#  student_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
