class SkillLevelsController < ApplicationController

  def show
    @skill_level   = SkillLevel.find(params[:id])
    @listening     = SkillLevel.where(student_id: :id)
    @achievements  = @skill_level.proficiency_level.achievement.where(
                      proficiency_level_id: @skill_level.proficiency_level_id
                      )
    @name          = @skill_level.proficiency_level.skill.name
    @level         = @skill_level.proficiency_level.level
    @student_achievements = StudentAchievement.all
    @student_record = StudentRecord.all
  end

  def new
    @skill_level   = SkillLevel.new()
    @student       = Student.find(params[:student_id])
    @student_achievements = StudentAchievement.new
  end

  def create
    @skill         = Skill.find(params[:skill_id])
    @skill_level   = SkillLevel.new(skill_level_params)
    if @skill_level.save
      redirect_to skilllevel_path(@skill_level)
      create_skill_level_achievements
    else
      render 'index'
    end
  end

  def create_student_achievement
    @skill_level   = SkillLevel.find(params[:id])
    achievement    = params[:achievement]
    @new_student_achievement = StudentAchievement.create(student_id: @skill_level.student.id, achievement_id: achievement)
    redirect_to request.referrer
  end

  def destroy_student_achievement
    achievement    = params[:student_achievement]
    StudentAchievement.find(achievement).destroy
    redirect_to request.referrer
  end

  def student_progress
    @count = @skill_level.proficiency_level.achievement.count
    @arrry = @skill_level.proficiency_level.achievement.each_with_object([]) do |arr, achievement |
      arr << achievement.id
    end
    # @completed = StudentAchievement.find_by(student_id: @skill_level.student.id, achievement_id: achievement_id).count


  end
  def level_up_proficiency
    @date = Date.new
    @skill_level   = SkillLevel.find(params[:id])
    @student_record = StudentRecord.create(student_id: @skill_level.student_id, proficiency_level_id: @skill_level.proficiency_level_id)

      @new = ProficiencyLevel.find_by( # Assign new prof_level
      level: @skill_level.proficiency_level.level + 1,  # Find correct one
      skill: @skill_level.proficiency_level.skill       # Find correct one
      )
      if @new.nil?
        redirect_to request.referrer,
        alert: 'The Student has achieved the highest proficiency'
      else
        @skill_level.update(proficiency_level_id: @new.id)
        @student_record.save
        redirect_to request.referrer
      end

  end
  private
  def skills_params
    params.require(:skill).permit(:name, :subject_id, :id)
  end
  def skill_level_params
    params.require(:skill_level).permit(:id, :level,  :statement, :skill_id)
  end

end
