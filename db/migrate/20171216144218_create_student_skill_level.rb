class CreateStudentSkillLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :student_skill_levels do |t|
      t.integer :student_id, foreign_key: true
      t.integer :skill_level_id, foreign_key: true
    end
  end
end
