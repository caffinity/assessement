class SkilllevelsController < ApplicationController

  def new
    @skill          = Skill.find(params[:skill_id])
    @skill_level    = SkillLevel.new()
    @students       = Student.all
  end

  def create
    @skill_level   = SkillLevel.new

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
    params.require(:skilllevel).permit(:id, :level,  :statement, :skill_id, :proficiency_id)
  end

end
