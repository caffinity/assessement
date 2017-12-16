class CreateSkill < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.string :name
      t.integer :subject_id, foreign_key: true
    end
  end
end
