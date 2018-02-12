class StudentsController < ApplicationController
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
          @name = "P#{proficiency_level.level}
                    #{proficiency_level.skill.name.capitalize}"
          arr << [@name, proficiency_level.id]
      end
    end
	end

  def view

  end

	def show
		@student = Student.find(params[:id])
    @student.skill_levels.each do |skill_level|
    @student_achievements = [] << @student.skill_levels.first.proficiency_level.achievement
    end
  end


  def edit
    @student = Student.find(params[:id])
    @proficiency_level = ProficiencyLevel.all
    @achievement = Achievement.all
    @skill = Skill.all
    @skill_level_select = @student.skill_levels.each_with_object([]) do |skill, arr|
        arr << skill.proficiency_level.id

      end
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
		if @student.save
			redirect_to student_path(@student)
      binding.pry


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
	  																		:free_school_meals,
                                        :avatar,
                                        skill_levels_attributes:
                                        [
                                          :student_id,
                                          :proficiency_level_id,
                                          :statement
                                        ]
	  																	)
	  end
	end
