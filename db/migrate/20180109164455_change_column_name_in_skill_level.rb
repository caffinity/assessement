class ChangeColumnNameInSkillLevel < ActiveRecord::Migration[5.1]
  def change
    remove_column :skill_levels, :level, :string
    remove_column :proficiency_levels, :skill_level_id, :integer
  end
end
