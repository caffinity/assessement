class SkillLevelsController < ApplicationController

  def show
    @skill_level = SkillLevel.find(params[:id])
    @listening = SkillLevel.where(student_id: :id)
    @achievements = @skill_level.proficiency_level.achievement.where(proficiency_level_id: @skill_level.proficiency_level_id)
    @name = @skill_level.proficiency_level.skill.name
    @level = @skill_level.proficiency_level.level
  end

  def new
    @skill_level   = SkillLevel.new()
    @student       = Student.find(params[:student_id])
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

  def update_proficiency
    skill_level.level_up_proficiency! # Controller lets model do all of the hard work
    redirect_to request.referrer
  end

  private
  def skills_params
    params.require(:skill).permit(:name, :subject_id, :id)
  end
  def skill_level_params
    params.require(:skill_level).permit(:id, :level,  :statement, :skill_id)
  end

end
