class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :teacher_id, foreign_key: true
    end
  end
end
