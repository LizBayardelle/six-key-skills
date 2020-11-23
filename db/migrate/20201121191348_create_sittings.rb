class CreateSittings < ActiveRecord::Migration[5.2]
  def change
    create_table :sittings do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
      t.string :results

      t.timestamps
    end
  end
end
