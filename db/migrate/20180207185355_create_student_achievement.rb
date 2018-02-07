class CreateStudentAchievement < ActiveRecord::Migration[5.1]
  def change
    create_table :student_achievements do |t|
      add_reference :students, foreign_key: true
      add_reference :achievements, foreign_key: true
    end
  end
end
