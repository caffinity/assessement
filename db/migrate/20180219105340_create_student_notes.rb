class CreateStudentNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :student_notes do |t|
      t.references :student, foreign_key: true
      t.text :note
      t.datetime :created_at
    end
  end
end
