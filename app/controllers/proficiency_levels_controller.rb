class ProficiencyLevelsController < ApplicationController

  def index

  end

  def show
    @proficiency_level = ProficiencyLevel.find(params[:id])
    @achievement = Achievement.where(proficiency_level_id: @proficiency_level.id)

  end


  def new
    @proficiency_level = ProficiencyLevel.new()
    @skill = Skill.find_by(id: params[:skill_reference])
  end

  def create
    @proficiency_level = ProficiencyLevel.new(proficiency_level_params)
    @skill = Skill.find_by(id: params[:skill_reference])

    if @proficiency_level.save
      redirect_to skill_path(@proficiency_level.skill_id)
    else
      render 'index'
    end
  end

  def edit
    @proficiency_level = ProficiencyLevel.find(params[:id])
  end


  def update
    @proficiency_level = ProficiencyLevel.find(params[:id])
    if @proficiency_level.update(proficiency_level_params)
      redirect_to @proficiency_level, notice: 'Level Updated'
    else

    end
  end

  def destroy
    @proficiency_level = ProficiencyLevel.find(params[:id])
    @proficiency_level.destroy
  end

  private

  def proficiency_level_params
    params.require(:proficiency_level).permit(:id, :level, :statement, :skill_id, :prefix)
  end

end
