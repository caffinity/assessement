class AddSkillLevelsToProficiencyLevel < ActiveRecord::Migration[5.1]
  def change
    add_reference :proficiency_levels, :skill_levels, foreign_key: true
  end
end
