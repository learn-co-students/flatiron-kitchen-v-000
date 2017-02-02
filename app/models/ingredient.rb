class Ingredient < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :recipe

  def create
    @ingredient = Ingredient.new(ingredient_params)
    
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end


  
end
