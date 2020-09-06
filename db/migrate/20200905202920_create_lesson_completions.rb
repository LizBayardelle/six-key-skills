class CreateLessonCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_completions do |t|
      t.references :lesson, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :started, default: true
      t.boolean :complete, default: false
      t.boolean :favorite, default: false

      t.timestamps
    end
  end
end
