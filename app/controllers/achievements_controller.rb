class AchievementsController < ApplicationController

  def index
  end

  def new
    @achievement = Achievement.new()
    @proficiency_level = ProficiencyLevel.find(params[:proficiency_level_id])
  end

  def create
    @achievement = Achievement.new(achievement_params)
    @proficiency_level = ProficiencyLevel.find(params[:proficiency_level_id])

    if @achievement.save
      redirect_to proficiency_level_path(@proficiency_level.id)
    else
      binding.pry
      render 'new'
    end
  end

  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update(achievement_params)
      redirect_to proficiency_level_path(@achievement.proficiency_level_id)
    else
      redirect_to subjects_path
    end
  end
  private

  def achievement_params
    params.require(:achievement).permit(:id, :name, :proficiency_level_id, :achieved)
  end
end
