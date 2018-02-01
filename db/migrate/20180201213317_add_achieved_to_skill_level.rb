class AddAchievedToSkillLevel < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :acheived, :boolean, null: false, default: false
  end
end
