class SkilllevelsController < ApplicationController

  def show
    @skill_level = SkillLevel.find(params[:id])
  end

  def new
    @skill          = Skill.find(params[:skill_id])
    @skill_level    = SkillLevel.new()
    @students       = Student.all
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
