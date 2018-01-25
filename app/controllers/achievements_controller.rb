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

  def student_achievement
    @achievement = Achievement.find(params[:id])
    unless @achievement.update(achievement_params)
      flash[:alert] = "Failed to update: @achievement.errors.full_messages"
    end
    render js: 'window.location.reload()'
  end

  private

  def achievement_params
    params.require(:achievement).permit(:id,
                                        :name,
                                        :proficiency_level_id,
                                        :achieved)
  end
end
