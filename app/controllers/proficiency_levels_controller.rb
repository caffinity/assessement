class ProficiencyLevelsController < ApplicationController

  def show
    @proficiency_level = ProficiencyLevel.find(params[:id])
  end


  def new
    @skill_level = SkillLevel.find(params[:skilllevel_id])
    @proficiency_level = ProficiencyLevel.new()
  end

  def create
    @skill_level = SkillLevel.find(params[:skilllevel_id])
    @proficiency_level = ProficiencyLevel.new(proficiency_level_params)
    binding.pry
    if @proficiency_level.save
      redirect_to proficiencylevel_path(@proficiency_level)
    else
      binding.pry
    end
  end

  private

  def proficiency_level_params
    params.require(:proficiency_level).permit(:id, :level, :statement, :skill_level_id)
  end

end
