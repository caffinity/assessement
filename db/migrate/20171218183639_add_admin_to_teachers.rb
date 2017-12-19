class AddAdminToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :admin, :boolean, null: false, default: false
  end
end
