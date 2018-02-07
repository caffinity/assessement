class CreateStudentAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :student_achievements do |t|

      t.timestamps
    end
  end
end
