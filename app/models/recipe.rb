class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :ingredient_recipes
  has_many :ingredients, through: :ingredient_recipes
  

  accepts_nested_attributes_for :ingredients


  def create
    @recipe = Recipe.new(recipe_params)
    binding.pry
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end

  end

  private

  def recipe_params
    params.require(:name)#.permit(:name, :birthday, :hometown)
  end





end
