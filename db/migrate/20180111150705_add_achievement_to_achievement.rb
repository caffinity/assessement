class AddAchievementToAchievement < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :achievement, :string
    add_column :achievements, :achieved, :boolean, null: false, default: false
  end
end
