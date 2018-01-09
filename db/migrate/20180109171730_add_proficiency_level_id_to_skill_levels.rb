class AddProficiencyLevelIdToSkillLevels < ActiveRecord::Migration[5.1]
  def change
    add_reference :skill_levels, :proficiency_level
  end
end
