class StudentsController < ApplicationController
	before_action :authenticate_teacher!



	def index
		@students =	current_teacher.admin? ? Student.all : current_teacher.classroom
	end

	def new	
		@students = Student.new
	end

	def show
	end


	def create
		@students = Student.new(params(student_params))

		if @student.save?
			redirect_to student_path
		else
			render 'show'
		end
	end



	  private

	  def student_params
	  	params.require(:students).permit(	:first_name, 
	  																		:last_name, 
	  																		:special_needs_education,
	  																		:classroom_id,
	  																		:year,
	  																		:pupil_premium,
	  																		:english_as_language,
	  																		:gender
	  																	)
	  end


end
