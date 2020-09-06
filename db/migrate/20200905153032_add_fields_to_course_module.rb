class AddFieldsToCourseModule < ActiveRecord::Migration[5.2]
  def change
    add_column :course_modules, :teaser, :string
    add_column :course_modules, :video, :string
    add_column :course_modules, :goal, :string
  end
end
