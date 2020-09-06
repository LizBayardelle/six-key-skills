class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.boolean :active, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
