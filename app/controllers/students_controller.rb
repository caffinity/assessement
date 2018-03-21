class StudentsController < ApplicationController
  include ActionView::Helpers::NumberHelper
	before_action :authenticate_teacher!
	before_action :set_student, only: [:show, :edit, :destroy]


	def index
		redirect_to new_classroom_path unless current_teacher.classroom || current_teacher.admin?
		@students =	current_teacher.admin? ? Student.all : Student.where(classroom_id: current_teacher.classroom.id)
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv }
      format.xls # { send_data @students.to_csv(col_sep: "\t") }
    end
	end

	def new
		@student                  = Student.new
    @proficiency_level        = ProficiencyLevel.all
    @skill                    = Skill.all
    @student.skill_levels.build
    @skill_level_select = @skill.each_with_object([]) do |other, arr|
        @proficiency_level.where(skill_id: other.id).each do |proficiency_level|
          @name = "#{proficiency_level.prefix}#{number_with_precision(proficiency_level.level,
                 strip_insignificant_zeros: true)}
                    #{proficiency_level.skill.name.capitalize}"
          arr << [@name, proficiency_level.id]
      end
    end
	end

  def view

  end

 def show
		@student = Student.find(params[:id])
    @student_achievements = @student.skill_levels.first.proficiency_level.achievement
    @student_record = StudentRecord.where(student_id: @student.id)
    @student_note = StudentNote.where(student_id: @student.id)
 end


  def edit
    @student = Student.find(params[:id])
    @proficiency_level = ProficiencyLevel.all
    @achievement = Achievement.all
    @skill = Skill.all

  end

 def update
    @student = Student.find(params[:id])

      if @student.update(student_params)
        redirect_to student_path(@student)
      else
      end

  end


	def create
		@student = Student.new(student_params)
		if @student.save && params[:commit] == "Create Student"
      redirect_to student_path(@student)
		elsif @student.save && params[:commit] == "Create and Add Another"
      redirect_to new_student_path
    else
      render 'show'
		end

	end

	def destroy
		@student.destroy
	end


	  private

  def create_another?

  end

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
	  																		:free_school_meals,
                                        :avatar,
                                        :commit,
                                        skill_levels_attributes:
                                        [
                                          :id,
                                          :student_id,
                                          :proficiency_level_id,
                                          :statement
                                        ]
	  																	)
	  end
	end
