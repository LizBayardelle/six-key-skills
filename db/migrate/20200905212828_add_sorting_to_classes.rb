class AddSortingToClasses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :sort, :integer
    add_column :course_modules, :sort, :integer
    add_column :lessons, :sort, :integer
  end
end
