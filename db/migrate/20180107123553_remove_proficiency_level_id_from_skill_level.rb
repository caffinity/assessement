class RemoveProficiencyLevelIdFromSkillLevel < ActiveRecord::Migration[5.1]
  def change
    remove_column(:skill_levels, :proficiency_level_id)
  end
end
