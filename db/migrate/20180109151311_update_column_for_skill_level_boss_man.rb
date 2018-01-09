class UpdateColumnForSkillLevelBossMan < ActiveRecord::Migration[5.1]
  def change
    rename_column :proficiency_levels, :skill_levels_id, :skill_level_id
  end
end
