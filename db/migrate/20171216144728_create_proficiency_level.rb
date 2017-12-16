class CreateProficiencyLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :proficiency_levels do |t|
      t.integer :level
      t.string :statement, null: false

    end
  end
end
