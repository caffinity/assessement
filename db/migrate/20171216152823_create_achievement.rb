class CreateAchievement < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.integer :proficiency_level_id, foreign_key: true
      t.string :name
    end
  end
end
