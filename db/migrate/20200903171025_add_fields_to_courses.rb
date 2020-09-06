class AddFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :teaser, :text
    add_column :courses, :description, :text
    add_column :courses, :reviews, :text
    add_column :courses, :sp1, :text
    add_column :courses, :sp2, :text
    add_column :courses, :sp3, :text
  end
end
