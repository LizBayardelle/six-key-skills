class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :result
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :quizzes, :slug, unique: true
  end
end
