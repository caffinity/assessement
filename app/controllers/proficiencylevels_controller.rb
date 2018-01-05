class ProficiencylevelsController < ApplicationController


def new
  @skill = Skill.find(params[:skill_id])
  @proficiency_level = ProficiencyLevel.new()
end

def create
@proficiency_level = ProficiencyLevel.new
@proficiency_level.save
binding.pry


end


end
