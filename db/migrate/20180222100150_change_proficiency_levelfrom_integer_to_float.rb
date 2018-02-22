class ChangeProficiencyLevelfromIntegerToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :proficiency_levels, :level, :float
  end
end
