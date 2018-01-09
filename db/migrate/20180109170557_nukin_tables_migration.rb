class NukinTablesMigration < ActiveRecord::Migration[5.1]
  def change
    drop_table :student_skill_levels
    add_reference :skill_levels, :student
  end
end
