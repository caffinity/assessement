class AddCreatedByToStudentNote < ActiveRecord::Migration[5.1]
  def change
    add_column :student_notes, :created_by, :string 
  end
end
