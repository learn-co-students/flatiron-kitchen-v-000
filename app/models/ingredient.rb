class Ingredient < ActiveRecord::Base
  validates :name, presence:true, allow_blank: false
  belongs_to :receipe
end
