class AddReferencesToSkillLevelAchievements < ActiveRecord::Migration[5.1]
  def change
    add_reference :skill_level_achievements, :proficiency_level
    add_reference :skill_level_achievements, :skill_level 
  end
end
