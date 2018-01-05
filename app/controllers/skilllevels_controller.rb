class SkilllevelsController < ApplicationController

  def new
    @skill        = Skill.find(params[:skill_id])
    @skilllevel   = SkillLevel.new()
  end

  def create
    @skill        = Skill.find(params[:skill_id])
    @skilllevel   = SkillLevel.new(skilllevel_params)
    binding.pry
    if @skilllevel.save
      redirect_to skilllevel_path(@skillLevel)
    else
      binding.pry
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
