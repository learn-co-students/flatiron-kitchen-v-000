class IngredientsController < ApplicationController
  def new
    @ingredient = Ingredient.new
  end
  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  def update
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end
end

  # def create
  #   @student = Student.new(student_params)
  #   if @student.save
  #     redirect_to @student
  #   else
  #     render 'new'
  #   end
  # end

  # def edit
  #   @student = Student.find(params[:id])
  # end

  # def show
  #   @student = Student.find(params[:id])
  # end

  # def index
  #   @students = Student.all
  # end

  # def student_params
  #   params.require(:student).permit(:name, :birthday, :hometown)
  # end
