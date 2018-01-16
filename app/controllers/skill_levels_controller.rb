class SkillLevelsController < ApplicationController

  def show
    @skill_level = SkillLevel.find(params[:id])
    @listening = SkillLevel.where(student_id: :id)
    @achievement = Achievement.where(proficiency_level_id: @skill_level.proficiency_level_id)
    @name = @skill_level.proficiency_level.skill.name
    @level = @skill_level.proficiency_level.level

  end

  def new
    @skill_level    = SkillLevel.new()
    @student      = Student.find(params[:student_id])
  end

  def create
    @skill         = Skill.find(params[:skill_id])
    @skill_level   = SkillLevel.new(skilllevel_params)
    if @skill_level.save
      redirect_to skilllevel_path(@skill_level)
    else

      render 'index'
    end
  end


  private
  def skills_params
    params.require(:skill).permit(:name, :subject_id, :id)
  end
  def skilllevel_params
    params.require(:skill_level).permit(:id, :level,  :statement, :skill_id)
  end

end
