class CreateSkillLevelAchievement < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_level_achievements do |t|
      t.string :achievement
      t.integer :skill_level, foreign_key: true
    end
  end
end
