class PandNLevelRecordsToProfieiencyLevel < ActiveRecord::Migration[5.1]
  def change
    add_column :proficiency_levels, :prefix , :string
  end
end
