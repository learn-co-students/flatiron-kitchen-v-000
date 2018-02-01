class Recipe < ActiveRecord::Base
  has_many :ingredients
  validates :name, presence:true, allow_blank: false
end
