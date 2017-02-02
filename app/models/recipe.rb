class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :ingredients

  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end

  end


# def new
#     @student = Student.new
#   end

#   def create
#     @student = Student.new(student_params)
#     if @student.save
#       redirect_to @student
#     else
#       render 'new'
#     end
#   end

#   def search
#     binding.pry
#     @student = Student.search
#   end
  

#   def edit
#     @student = Student.find(params[:id])
#   end

#   def show
#     @student = Student.find(params[:id])
#   end

#   def index
#     @students = Student.all
#   end

  private

  def recipe_params
    params.require(:name)#.permit(:name, :birthday, :hometown)
  end





end
