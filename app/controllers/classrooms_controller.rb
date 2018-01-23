class ClassroomsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_classroom, only: [:show, :destroy]

  def index
  	@students = Student.all
  	@classroom = Classroom.all
  	@teacher = Teacher.all
  end

  def new
  	@classroom = Classroom.new
    @teacher = Teacher.all
    @teacher_list = @teacher.each_with_object([]) do |teacher, arr|
      name = [teacher.first_name.capitalize, " ", teacher.last_name.capitalize].join
      arr << [name, teacher.id]
    end

  end

  def create
    @classroom = Classroom.new(classroom_param)
    @teacher = Teacher.all

    if @classroom.save
      redirect_to classrooms_path
    else
      render 'new'
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
    @students = Student.where(classroom: @classroom.id)
    @students_in_class =  @students.each do |students|
      [] << students.first_name
    end
  end

  def destroy
    @classroom.destroy
    redirect_to 'index'
  end


  private
  def classroom_param
    params.require(:classroom).permit(:teacher_id, :name, :id)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end
