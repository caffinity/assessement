class UpdateTablesToRefactorModel < ActiveRecord::Migration[5.1]
  def change
    add_reference :proficiency_levels, :skill, index: true
    remove_column :skill_levels, :skill_id, :integer

  end
end
