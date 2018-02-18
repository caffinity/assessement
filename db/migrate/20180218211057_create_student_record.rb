class CreateStudentRecord < ActiveRecord::Migration[5.1]
  def change
    create_table :student_records do |t|
      t.references :student, foreign_key: true
      t.references :proficiency_level, foreign_key: true
      t.datetime :created_at
    end
  end
end
