class CreateCourseModules < ActiveRecord::Migration[5.2]
  def change
    create_table :course_modules do |t|
      t.string :title
      t.text :description
      t.references :course, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
