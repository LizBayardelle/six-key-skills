class AddMoreFieldsToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :motivation, :boolean, default: false
    add_column :courses, :mindset, :boolean, default: false
    add_column :courses, :resourcing, :boolean, default: false
    add_column :courses, :planning, :boolean, default: false
    add_column :courses, :time_management, :boolean, default: false
    add_column :courses, :discipline, :boolean, default: false
    add_column :courses, :pinterest_description, :string
    add_column :courses, :featured, :boolean, default: false
  end
end
