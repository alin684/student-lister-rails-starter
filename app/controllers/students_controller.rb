class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    # Student.create(student_params)

    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      # redirect_to new_student_path
      # need @student obj with all the errors created on line 17 so if we redirect to new_student_path, we lose all the errors
      # so we need to render new.html.erb
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :dob)
  end
end
