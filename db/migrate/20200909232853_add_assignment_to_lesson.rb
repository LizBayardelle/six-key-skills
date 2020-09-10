class AddAssignmentToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :assignment, :text
    add_column :lessons, :materials, :text
  end
end
