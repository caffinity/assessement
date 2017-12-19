class ClassroomsController < ApplicationController
  before_action :authenticate_teacher!


  def index
  	@students = Student.all
  	@classroom = Classroom.all
  	@teacher = Teacher.all
  end

  def new 
  	@classroom = Classroom.new	
  end

  def show
  end


end
