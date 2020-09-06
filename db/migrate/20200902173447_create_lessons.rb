class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :video
      t.references :course_module, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
