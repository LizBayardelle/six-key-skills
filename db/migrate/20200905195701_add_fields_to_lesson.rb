class AddFieldsToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :teaser, :string
    add_column :lessons, :goal, :string
  end
end
