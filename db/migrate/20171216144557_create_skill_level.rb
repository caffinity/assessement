class CreateSkillLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_levels do |t|
      t.string :level
      t.string :statement
      t.integer :skill_id, foreign_key: true
      t.integer :proficiency_level_id, foreign_key: true

    end
  end
end
