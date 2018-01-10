class StudentsController < ApplicationController
	before_action :authenticate_teacher!
	before_action :set_student, only: [:show, :edit, :destroy]


	def index
		redirect_to new_classroom_path unless current_teacher.classroom || current_teacher.admin?
		@students =	current_teacher.admin? ? Student.all : current_teacher.classroom
	end

	def new
		@students = Student.new
	end

	def show
		@student = Student.find(params[:id])
    @pie_chart_values = @student.skill_levels.each_with_object({}) do |skill_level, hash|
        name = [
          skill_level.proficiency_level.skill.name, # => reading
          ' p',
          skill_level.proficiency_level.level # => 5
                ].join
        hash[name] = 1
      end

      @pieData = @student.skill_levels.each_with_object([]) do |skill_level, arr|
        arr << {  value: 1,
                  color: skill_level.proficiency_level.skill.color,
                  highlight: "#FF5A5E",
                  label: skill_level.proficiency_level.skill.name
                }

      end

      @pieSize = {:height => 300,
                  :width  => 300}

	end

	def edit
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path
		else
			render 'show'
		end
	end

	def destroy
		@student.destroy
	end


	  private

	def set_student
    @student = Student.find(params[:id])
  end

	  def student_params
	  	params.require(:student).permit(	:first_name,
	  																		:last_name,
	  																		:special_needs_education,
	  																		:classroom_id,
	  																		:year,
	  																		:pupil_premium,
	  																		:english_as_language,
	  																		:gender,
	  																		:free_school_meals
	  																	)
	  end
	end
