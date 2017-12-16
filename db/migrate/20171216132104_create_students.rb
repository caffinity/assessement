class CreateStudents < ActiveRecord::Migration[5.1]
  def change
      create_table :students do |t|
        t.string :first_name
        t.string :last_name
        t.string :special_education_need
        t.integer :classroom_id, foreign_key: true
        t.integer :year
        t.boolean :pupil_premium
        t.boolean :free_school_meals
        t.boolean :english_as_language
        t.boolean :gender

    end
  end
end
