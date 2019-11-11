class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
