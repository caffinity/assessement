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
  end

  def show
    @students = Student.where(classroom: @classroom)
  end

  def destroy
    @classroom.destroy
    redirect_to 'index'
  end


  private 

  def set_classroom 
    @classroom = Classroom.find(params[:id])
  end
end
