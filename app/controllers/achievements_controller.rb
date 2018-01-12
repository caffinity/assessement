class AchievementsController < ApplicationController

  def new
    @achievement = Achievement.new()
    @proficiency_level = ProficiencyLevel.find(params[:proficiency_level_id])
  end



private

def achievement_params
  params.require(:achievement).permit(:id, :name, :proficiency_level_id)
end
end
